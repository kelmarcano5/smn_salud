select
		smn_salud.smn_prestacion_servicio_medico_detalle.smn_prestacion_servicio_medico_detalle_id,
	smn_salud.smn_prestacion_servicio_medico_cabecera.smn_prestacion_servicio_medico_cabecera_id,
	case
	when smn_salud.smn_prestacion_servicio_medico_detalle.psd_tipo_componentes='IT' then '${lbl:b_item}'
	when smn_salud.smn_prestacion_servicio_medico_detalle.psd_tipo_componentes='SE' then '${lbl:b_services}'
	when smn_salud.smn_prestacion_servicio_medico_detalle.psd_tipo_componentes='HO' then '${lbl:b_honorary}'
	end as psd_tipo_componentes_combo,
	case
		when smn_salud.smn_prestacion_servicio_medico_detalle.psd_estatus='RE' then 'Registrada'
		when smn_salud.smn_prestacion_servicio_medico_detalle.psd_estatus='AP' then '${lbl:b_aprobated}'
		when smn_salud.smn_prestacion_servicio_medico_detalle.psd_estatus='RZ' then '${lbl:b_not_aprobated}'
						when smn_salud.smn_prestacion_servicio_medico_detalle.psd_estatus='SO' then '${lbl:b_solicited}'
	end as psd_estatus,
	smn_salud.smn_prestacion_servicio_medico_detalle.smn_prestacion_servicio_medico_cabecera_id,
	smn_salud.smn_prestacion_servicio_medico_detalle.smn_ingresos_mov_id,
	smn_salud.smn_prestacion_servicio_medico_detalle.psd_tipo_componentes,
		smn_base.smn_auxiliar.aux_codigo as documento_identidad,
	smn_base.smn_auxiliar.aux_nombres ||' '|| smn_base.smn_auxiliar.aux_apellidos as nombre_apellido,
	smn_salud.smn_ingresos.smn_documento_id as documento,
	smn_salud.smn_ingresos.smn_ingresos_id as ingreso,
	smn_salud.smn_ingresos.igs_fecha_registro as fecha_ingreso,
	smn_salud.smn_ingresos.igs_ticket as ticket,
	smn_salud.smn_prestacion_servicio_medico_detalle.psd_cantidad,
	smn_salud.smn_prestacion_servicio_medico_detalle.psd_fecha_registro,
	smn_salud.smn_prestacion_servicio_medico_cabecera.psc_estatus_financiero as psd_estatus_cabecera,
	smn_base.smn_servicios.svc_descripcion as smn_servicios_rf,
	smn_inventario.smn_principio_activo.pac_descripcion as smn_principio_activo_id,
	smn_base.smn_item.itm_codigo ||' - '|| smn_base.smn_item.itm_nombre as smn_item_rf,
	smn_salud.smn_prestacion_servicio_medico_detalle.psd_agregado_usuario,
	smn_salud.smn_prestacion_servicio_medico_detalle.psd_hora,
	smn_salud.smn_prestacion_servicio_medico_detalle.smn_recipes_medicos_id
	
from
	smn_salud.smn_prestacion_servicio_medico_detalle
	inner join smn_salud.smn_prestacion_servicio_medico_cabecera on smn_salud.smn_prestacion_servicio_medico_cabecera.smn_prestacion_servicio_medico_cabecera_id = smn_salud.smn_prestacion_servicio_medico_detalle.smn_prestacion_servicio_medico_cabecera_id
	inner join smn_salud.smn_ingresos on smn_salud.smn_ingresos.smn_ingresos_id = smn_salud.smn_prestacion_servicio_medico_cabecera.smn_ingresos_id
	left outer join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_salud.smn_ingresos.smn_auxiliar_rf
	inner join smn_base.smn_servicios on smn_base.smn_servicios.smn_servicios_id = smn_salud.smn_prestacion_servicio_medico_detalle.smn_servicios_rf
	inner join smn_inventario.smn_principio_activo on smn_inventario.smn_principio_activo.smn_principio_activo_id = smn_salud.smn_prestacion_servicio_medico_detalle.smn_item_rf
	inner join smn_base.smn_item on smn_base.smn_item.smn_item_id = smn_salud.smn_prestacion_servicio_medico_detalle.smn_item_rf
where
	smn_prestacion_servicio_medico_detalle_id is not null and
	smn_salud.smn_prestacion_servicio_medico_detalle.psd_tipo_componentes='IT'
		${filter}
order by
		smn_prestacion_servicio_medico_detalle_id
