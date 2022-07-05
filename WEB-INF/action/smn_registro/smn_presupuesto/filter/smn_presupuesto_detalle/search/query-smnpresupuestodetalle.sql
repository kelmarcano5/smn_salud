select DISTINCT
	(select smn_salud.smn_presupuesto.pre_numero_control from  smn_salud.smn_presupuesto  where smn_salud.smn_presupuesto.smn_presupuesto_id is not null  and smn_salud.smn_presupuesto.smn_presupuesto_id=smn_salud.smn_presupuesto_detalle.smn_presupuesto_id  order by smn_salud.smn_presupuesto.pre_numero_control ) as smn_presupuesto_id,
	smn_salud.smn_presupuesto_detalle.smn_presupuesto_id,
	smn_base.smn_servicios.svc_codigo||' - '||smn_base.smn_servicios.svc_descripcion as smn_servicios_rf,
	case 
		when smn_salud.smn_presupuesto_detalle.smn_tipo_componentes_rf='SE' THEN smn_base.smn_servicios.svc_codigo||' - '||smn_base.smn_servicios.svc_descripcion
		when smn_salud.smn_presupuesto_detalle.smn_tipo_componentes_rf='IT' THEN smn_base.smn_item.itm_nombre
	end as smn_componentes_rf,
	smn_salud.smn_presupuesto_detalle.prd_cantidad,
	smn_salud.smn_presupuesto_detalle.prd_precio,
	smn_salud.smn_presupuesto_detalle.smn_moneda_rf,
	smn_salud.smn_presupuesto_detalle.prd_precio_ma,
	smn_salud.smn_presupuesto_detalle.smn_servicios_rf as servicio,
		smn_salud.smn_presupuesto_detalle.prd_moneda_alterna,
	smn_salud.smn_presupuesto_detalle.prd_monto_moneda_local,
	smn_salud.smn_presupuesto_detalle.prd_fecha_registro,
	smn_salud.smn_presupuesto_detalle.smn_presupuesto_detalle_id,
	smn_base.smn_nivel_estructura.nes_nombre as smn_item_rf,
	smn_salud.smn_presupuesto_detalle.smn_tipo_componentes_rf as tipo_comp,
	smn_salud.smn_presupuesto_detalle.prd_monto_neto_ml,
	smn_salud.smn_presupuesto_detalle.prd_monto_neto_ma,
	case
		when smn_salud.smn_presupuesto_detalle.prd_estatus='RE' then '${lbl:b_registe}'
		when smn_salud.smn_presupuesto_detalle.prd_estatus='GE' then '${lbl:b_generate}'
		when smn_salud.smn_presupuesto_detalle.prd_estatus='RZ' then 'Rechazado'
		when smn_salud.smn_presupuesto_detalle.prd_estatus='AP' then 'Aprobado'
	end as prd_estatus,	
	case 
		when smn_salud.smn_presupuesto_detalle.prd_naturaleza='IT' THEN '${lbl:b_item}'
		when smn_salud.smn_presupuesto_detalle.prd_naturaleza='SE' THEN '${lbl:b_service}'
	end as prd_naturaleza,
	case 
		when smn_salud.smn_presupuesto_detalle.prd_naturaleza='IT' then smn_base.smn_nivel_estructura.nes_nombre 
		when smn_salud.smn_presupuesto_detalle.prd_naturaleza='SE' then smn_base.smn_servicios.svc_codigo||' - '||smn_base.smn_servicios.svc_descripcion
	end as item_serv,
	smn_salud.smn_presupuesto_detalle.prd_moneda_alterna+smn_salud.smn_presupuesto_detalle.prd_monto_incremento_ma as monto_incremento,
	smn_salud.smn_documento.tca_tipo_tasa as tipotasa,
	smn_salud.smn_documento.doc_maneja_moneda_alt as maneja_mon_alterna
from 
	smn_salud.smn_presupuesto_detalle
	inner join smn_salud.smn_presupuesto on smn_salud.smn_presupuesto.smn_presupuesto_id = smn_salud.smn_presupuesto_detalle.smn_presupuesto_id
	left join smn_base.smn_servicios on smn_base.smn_servicios.smn_servicios_id = smn_salud.smn_presupuesto_detalle.smn_servicios_rf
	left join smn_base.smn_componentes on smn_base.smn_componentes.smn_componentes_id = smn_salud.smn_presupuesto_detalle.smn_componentes_rf
	left join smn_base.smn_nivel_estructura on smn_base.smn_nivel_estructura.smn_nivel_estructura_id = smn_salud.smn_presupuesto_detalle.smn_item_rf
	left join smn_base.smn_item on smn_base.smn_item.smn_item_id = smn_salud.smn_presupuesto_detalle.smn_item_rf
	inner join smn_salud.smn_documento on smn_salud.smn_documento.smn_documento_id = smn_salud.smn_presupuesto.smn_documento_id
where 
	smn_salud.smn_presupuesto_detalle.smn_presupuesto_id = ${fld:id_pre} 
order by 
	smn_salud.smn_presupuesto_detalle.smn_presupuesto_detalle_id desc