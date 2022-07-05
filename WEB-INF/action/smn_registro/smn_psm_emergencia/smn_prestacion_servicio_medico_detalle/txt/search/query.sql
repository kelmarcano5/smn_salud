select
	smn_salud.smn_prestacion_servicio_medico_detalle.smn_prestacion_servicio_medico_detalle_id,
	smn_salud.smn_prestacion_servicio_medico_cabecera.smn_prestacion_servicio_medico_cabecera_id,
	smn_salud.smn_prestacion_servicio_medico_cabecera.psc_estatus as psc_estatus_pl0,
	smn_salud.smn_ingresos_mov.smn_ingresos_mov_id,
	smn_salud.smn_ingresos_mov.inm_localidad as inm_localidad_pl1,
	case
	when smn_salud.smn_prestacion_servicio_medico_detalle.psd_tipo_componentes='IT' then '${lbl:b_item}'
	when smn_salud.smn_prestacion_servicio_medico_detalle.psd_tipo_componentes='SE' then '${lbl:b_services}'
	when smn_salud.smn_prestacion_servicio_medico_detalle.psd_tipo_componentes='HO' then '${lbl:b_honorary}'
	end as psd_tipo_componentes_combo,
	case
	when smn_salud.smn_prestacion_servicio_medico_detalle.psd_estatus='RE' then '${lbl:b_register}'
	when smn_salud.smn_prestacion_servicio_medico_detalle.psd_estatus='AP' then '${lbl:b_aprobated}'
	when smn_salud.smn_prestacion_servicio_medico_detalle.psd_estatus='RZ' then '${lbl:b_not_aprobated}'
	end as psd_estatus_combo,
	smn_salud.smn_prestacion_servicio_medico_detalle.smn_prestacion_servicio_medico_cabecera_id,
	smn_salud.smn_prestacion_servicio_medico_detalle.smn_mov_caja_detalle_id,
	smn_salud.smn_prestacion_servicio_medico_detalle.smn_ingresos_mov_id,
	smn_salud.smn_prestacion_servicio_medico_detalle.psd_tipo_componentes,
	smn_salud.smn_prestacion_servicio_medico_detalle.psd_cantidad,
	smn_salud.smn_prestacion_servicio_medico_detalle.psd_estatus,
	smn_salud.smn_prestacion_servicio_medico_detalle.psd_fecha_registro
	
from
	smn_salud.smn_prestacion_servicio_medico_detalle
where
	smn_salud.smn_prestacion_servicio_medico_cabecera.smn_prestacion_servicio_medico_cabecera_id=smn_salud.smn_prestacion_servicio_medico_detalle.smn_prestacion_servicio_medico_cabecera_id and
	smn_salud.smn_ingresos_mov.smn_ingresos_mov_id=smn_salud.smn_prestacion_servicio_medico_detalle.smn_ingresos_mov_id
