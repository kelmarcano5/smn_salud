select
		smn_salud.smn_prestacion_servicio_medico_detalle.smn_prestacion_servicio_medico_detalle_id,
	smn_salud.smn_prestacion_servicio_medico_cabecera.smn_prestacion_servicio_medico_cabecera_id,
	smn_salud.smn_prestacion_servicio_medico_cabecera.psc_estatus as psc_estatus_pl0,
	smn_salud.smn_ingreso_movimiento.smn_ingresos_mov_id,
	case
	when smn_salud.smn_prestacion_servicio_medico_detalle.psd_tipo_componentes='IT' then '${lbl:b_item}'
	when smn_salud.smn_prestacion_servicio_medico_detalle.psd_tipo_componentes='SE' then '${lbl:b_services}'
	when smn_salud.smn_prestacion_servicio_medico_detalle.psd_tipo_componentes='HO' then '${lbl:b_honorary}'
	end as psd_tipo_componentes,
	case
	when smn_salud.smn_prestacion_servicio_medico_detalle.psd_estatus='RE' then '${lbl:b_register}'
	when smn_salud.smn_prestacion_servicio_medico_detalle.psd_estatus='AP' then '${lbl:b_aprobated}'
	when smn_salud.smn_prestacion_servicio_medico_detalle.psd_estatus='RZ' then '${lbl:b_not_aprobated}'
	end as psd_estatus,
	case
	when smn_salud.smn_prestacion_servicio_medico_detalle.psd_agregado_usuario='SI' then '${lbl:b_yes}'
	when smn_salud.smn_prestacion_servicio_medico_detalle.psd_agregado_usuario='NO' then '${lbl:b_not}'
	end as psd_agregado_usuario,
	smn_salud.smn_prestacion_servicio_medico_detalle.smn_mov_caja_detalle_id as smn_mov_caja_detalle_id,
	smn_salud.smn_ingreso_movimiento.smn_ingresos_mov_id as inm_localidad_pl1,
		smn_salud.smn_prestacion_servicio_medico_detalle.smn_almacen_rf as smn_almacen_rf,
	smn_salud.smn_prestacion_servicio_medico_detalle.smn_unidades_servicios_rf as smn_unidades_servicios_rf,
	smn_salud.smn_prestacion_servicio_medico_detalle.smn_componentes_rf as smn_componentes_rf,
	smn_salud.smn_prestacion_servicio_medico_detalle.smn_item_rf as smn_item_rf,
		smn_salud.smn_prestacion_servicio_medico_detalle.smn_prestador_servicio_rf as smn_prestador_servicio_rf,
		smn_salud.smn_prestacion_servicio_medico_detalle.smn_servicios_rf as smn_servicios_rf,
		smn_salud.smn_prestacion_servicio_medico_detalle.smn_moneda_rf as smn_moneda_rf,
		smn_salud.smn_prestacion_servicio_medico_detalle.psd_observaciones_rf as obs_descripcion,
			smn_salud.smn_prestacion_servicio_medico_detalle.*
	
from
	smn_salud.smn_prestacion_servicio_medico_detalle
	inner join smn_salud.smn_prestacion_servicio_medico_cabecera on smn_salud.smn_prestacion_servicio_medico_cabecera.smn_prestacion_servicio_medico_cabecera_id = smn_salud.smn_prestacion_servicio_medico_detalle.smn_prestacion_servicio_medico_cabecera_id
	inner join smn_salud.smn_ingreso_movimiento on smn_salud.smn_ingreso_movimiento.smn_ingresos_mov_id = smn_salud.smn_prestacion_servicio_medico_detalle.smn_ingresos_mov_id
where
	smn_prestacion_servicio_medico_detalle_id = ${fld:id}
