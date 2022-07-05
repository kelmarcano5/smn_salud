select
	smn_salud.smn_ingreso_movimiento.smn_ingresos_mov_id, 
	smn_salud.smn_ingreso_movimiento.smn_ingreso_id, 
	smn_salud.smn_ingreso_movimiento.smn_servicios_rf,  
	smn_salud.smn_ingreso_movimiento.smn_unidades_servicios_rf,
	case
		when smn_base.smn_baremos.bar_tipo is null then 'G' else smn_base.smn_baremos.bar_tipo end
	as tipo_precio, 
	case
		when smn_salud.smn_ingreso_movimiento.smn_moneda_rf is null then 0 else smn_salud.smn_ingreso_movimiento.smn_moneda_rf end
	as smn_moneda_rf,
	case 
		when smn_salud.smn_contratante.smn_baremos_id is null then (select smn_base.smn_baremos.smn_baremos_id from smn_base.smn_baremos where smn_base.smn_baremos.bar_tipo='G') else smn_salud.smn_contratante.smn_baremos_id 
	end as baremos_id,
	smn_salud.smn_contratante.smn_contratante_id,
	case 
		when smn_salud.smn_ingresos.smn_contratante_id is null then smn_salud.smn_ingresos.smn_auxiliar_rf else smn_salud.smn_contratante.smn_auxiliar_rf
	end as smn_auxiliar_rf,
	smn_salud.smn_contratante.smn_clase_baremos_rf as smn_clase_rf,
	smn_salud.smn_documento.tca_tipo_tasa as tipo_tasa,
	case
		when smn_salud.smn_ingreso_movimiento.smn_prestador_servicio_rf is null then 0 else smn_salud.smn_ingreso_movimiento.smn_prestador_servicio_rf end
	as smn_prestador_servicio_rf,
	case
		when smn_salud.smn_ingreso_movimiento.smn_grupo_prestador_servicio_rf is null then 0 else smn_salud.smn_ingreso_movimiento.smn_grupo_prestador_servicio_rf end
	as smn_grupo_prestador_servicio_rf
from
	smn_salud.smn_ingreso_movimiento
	inner join smn_salud.smn_ingresos on smn_salud.smn_ingresos.smn_ingresos_id = smn_salud.smn_ingreso_movimiento.smn_ingreso_id
	left join smn_salud.smn_contratante on smn_salud.smn_contratante.smn_contratante_id = smn_salud.smn_ingresos.smn_contratante_id
	left join smn_base.smn_baremos on smn_base.smn_baremos.smn_baremos_id = smn_salud.smn_contratante.smn_baremos_id
	inner join smn_salud.smn_documento on smn_salud.smn_documento.smn_documento_id = smn_salud.smn_ingresos.smn_documento_id
where smn_salud.smn_ingresos.smn_ingresos_id = ${fld:id_ingreso} and smn_salud.smn_ingreso_movimiento.smn_servicios_rf is not null and smn_salud.smn_ingreso_movimiento.inm_estatus = 'AC'