WITH rows as (
	select 
		SUM(smn_salud.smn_presupuesto_detalle.prd_monto_moneda_local+smn_salud.smn_presupuesto_detalle.prd_monto_incremento_ml-smn_salud.smn_presupuesto_detalle.prd_monto_descuento_ml) as monto_ml,
		SUM(smn_salud.smn_presupuesto_detalle.prd_moneda_alterna+smn_salud.smn_presupuesto_detalle.prd_monto_incremento_ma-smn_salud.smn_presupuesto_detalle.prd_monto_descuento_ma) as monto_ma,
		SUM(smn_salud.smn_presupuesto_detalle.prd_monto_descuento_ml) as monto_descuento_ml,
		SUM(smn_salud.smn_presupuesto_detalle.prd_monto_descuento_ma) as monto_descuento_ma,
		SUM(smn_salud.smn_presupuesto_detalle.prd_monto_incremento_ml) as monto_incremento_ml,
		SUM(smn_salud.smn_presupuesto_detalle.prd_monto_incremento_ma) as monto_incremento_ma,
		SUM(smn_salud.smn_presupuesto_detalle.prd_monto_neto_ml) as monto_neto_ml,
		SUM(smn_salud.smn_presupuesto_detalle.prd_monto_neto_ma) as monto_neto_ma
	from 
		smn_salud.smn_presupuesto_detalle
	where
		smn_salud.smn_presupuesto_detalle.smn_presupuesto_id=${fld:id2} 
		and smn_salud.smn_presupuesto_detalle.prd_estatus<>'RZ' 
		and smn_salud.smn_presupuesto_detalle.smn_tipo_componentes_rf in('SE','IT')
) 
update 
	smn_salud.smn_presupuesto
set
	pre_monto_ml=rows.monto_ml,
	pre_monto_ma=rows.monto_ma,
	pre_monto_descuento=rows.monto_descuento_ml,
	pre_monto_descuento_moneda_alterna=rows.monto_descuento_ma,
	pre_monto_neto_moneda_local=rows.monto_neto_ml,
	pre_monto_neto_moneda_alterna=rows.monto_neto_ma
from 
	rows
where
	smn_salud.smn_presupuesto.smn_presupuesto_id = ${fld:id2};

-------OBTIENE EL PRECIO Y LO ACTUALIZA CON EL PRECIO DEL SERVICIO-----------------
with rows as (
	select 
		(select smn_base.smn_tasas_de_cambio.smn_tasas_de_cambio_id from smn_base.smn_tasas_de_cambio where smn_base.smn_tasas_de_cambio.tca_fecha_vigencia=CURRENT_DATE LIMIT 1) AS smn_tasa_rf,
		smn_salud.smn_presupuesto_detalle.smn_presupuesto_id as idp, 
		smn_salud.smn_presupuesto_detalle.smn_presupuesto_detalle_id as idd, 
		smn_salud.smn_presupuesto_detalle.smn_servicios_rf as servicio, 
		smn_salud.smn_presupuesto_detalle.prd_monto_neto_ml as monto_honorario_ml,
		smn_salud.smn_presupuesto_detalle.prd_monto_neto_ma as monto_honorario_ma 
	from 
		smn_salud.smn_presupuesto_detalle 
	where 
		smn_salud.smn_presupuesto_detalle.smn_presupuesto_id=${fld:id2} 
		and smn_salud.smn_presupuesto_detalle.smn_tipo_componentes_rf='SE'
) 
UPDATE smn_salud.smn_presupuesto_detalle SET 
		prd_precio = rows.monto_honorario_ml,
		prd_precio_ma = rows.monto_honorario_ma,
		smn_tasa_rf=rows.smn_tasa_rf
from 
	rows
where 
	smn_salud.smn_presupuesto_detalle.smn_presupuesto_id=${fld:id2} 
	and smn_salud.smn_presupuesto_detalle.smn_tipo_componentes_rf='HO' 
	and smn_salud.smn_presupuesto_detalle.smn_servicios_rf=rows.servicio;

-------ACTUALIZA LOS PRECIO MONTO MONEDA LOCAL Y MONTO MONEDA ALTERNA-----------------
with rows as (
	select 
	smn_salud.smn_presupuesto_detalle.smn_presupuesto_detalle_id as idp,
	case 
		when smn_salud.smn_presupuesto_detalle.smn_tipo_componentes_rf='HO' then smn_salud.smn_presupuesto_detalle.prd_precio
	end as precio, 
	case 
		when smn_salud.smn_presupuesto_detalle.smn_tipo_componentes_rf='HO' THEN smn_salud.smn_presupuesto_detalle.prd_porcentaje_prestador	
	end as porcentaje,
		case 
		when smn_salud.smn_presupuesto_detalle.smn_tipo_componentes_rf='HO' then smn_salud.smn_presupuesto_detalle.prd_precio_ma 	
	end as precio_ma
	from smn_salud.smn_presupuesto_detalle where smn_salud.smn_presupuesto_detalle.smn_presupuesto_id= ${fld:id2} and smn_salud.smn_presupuesto_detalle.smn_tipo_componentes_rf='HO' and smn_salud.smn_presupuesto_detalle.prd_estatus<>'RZ'
)
UPDATE 
	smn_salud.smn_presupuesto_detalle 
SET 
	prd_monto_moneda_local = rows.precio * rows.porcentaje/100, 
	prd_monto_neto_ml = rows.precio * rows.porcentaje/100, 
	prd_moneda_alterna = rows.precio_ma * rows.porcentaje/100,
	prd_monto_neto_ma = rows.precio_ma * rows.porcentaje/100
from 
	rows
where 
	smn_salud.smn_presupuesto_detalle.smn_presupuesto_id=${fld:id2} 
	and smn_salud.smn_presupuesto_detalle.smn_presupuesto_detalle_id =rows.idp 
	and smn_salud.smn_presupuesto_detalle.smn_tipo_componentes_rf='HO' 
	and smn_salud.smn_presupuesto_detalle.prd_estatus<>'RZ';


