select
	smn_salud.smn_prestacion_servicio_medico_detalle.smn_prestacion_servicio_medico_detalle_id,
	smn_salud.smn_ingreso_movimiento.smn_ingresos_mov_id,
	case
		when paciente.aux_sexo = 'MA' then 'Masculino' 
		when paciente.aux_sexo = 'FE' then 'Femenino' 
	end as sexo, 
	date_part('year', Age(paciente.aux_fecha_nac)) as edad,
	smn_salud.smn_prestacion_servicio_medico_detalle.smn_prestador_servicio_rf,
	case
		when smn_salud.smn_prestacion_servicio_medico_detalle.psd_tipo_componentes='IT' then '${lbl:b_item}'
		when smn_salud.smn_prestacion_servicio_medico_detalle.psd_tipo_componentes='SE' then '${lbl:b_services}'
		when smn_salud.smn_prestacion_servicio_medico_detalle.psd_tipo_componentes='HO' then '${lbl:b_honorary}'
	end as psd_tipo_componentes_combo,
	case
		when smn_salud.smn_prestacion_servicio_medico_detalle.psd_estatus='RE' then '${lbl:b_register}'
		when smn_salud.smn_prestacion_servicio_medico_detalle.psd_estatus='AP' then '${lbl:b_aprobated}'
		when smn_salud.smn_prestacion_servicio_medico_detalle.psd_estatus='RZ' then '${lbl:b_not_aprobated}'
		when smn_salud.smn_prestacion_servicio_medico_detalle.psd_estatus='AC' then '${lbl:b_active}'
		when smn_salud.smn_prestacion_servicio_medico_detalle.psd_estatus='AT' then 'Atendido'
	end as estatus,
	smn_salud.smn_prestacion_servicio_medico_detalle.smn_prestacion_servicio_medico_cabecera_id,
	smn_salud.smn_prestacion_servicio_medico_detalle.smn_mov_caja_detalle_id,
	smn_salud.smn_prestacion_servicio_medico_detalle.smn_ingresos_mov_id,
	smn_salud.smn_prestacion_servicio_medico_detalle.psd_tipo_componentes,
	paciente.aux_codigo as documento_identidad,
	paciente.aux_nombres ||' '|| paciente.aux_apellidos as nombre_paciente,
	paciente.aux_num_doc_oficial as cedula,
	smn_salud.smn_ingresos.smn_documento_id as documento,
	smn_salud.smn_ingresos.smn_ingresos_id as num_ingreso,
	smn_salud.smn_ingresos.igs_fecha_registro as fecha_ingreso,
	smn_salud.smn_ingresos.igs_ticket as ticket,
	smn_salud.smn_prestacion_servicio_medico_detalle.psd_cantidad,
	smn_salud.smn_prestacion_servicio_medico_detalle.psd_fecha_registro,
	smn_base.smn_servicios.svc_codigo ||' - '|| smn_base.smn_servicios.svc_descripcion as servicio,
	smn_salud.smn_ingresos.smn_auxiliar_rf as paciente_id,
	smn_salud.smn_prestacion_servicio_medico_cabecera.psc_estatus_financiero as psd_estatus_cabecera,
	smn_base.smn_tipos_servicios.tsr_descripcion as tipo_servicio,
	smn_salud.smn_naturaleza_servicio.nts_naturaleza,
	smn_base.smn_componentes.cmp_codigo ||' - '|| smn_base.smn_componentes.cmp_descripcion as componentes
from
	smn_salud.smn_prestacion_servicio_medico_detalle
	inner join smn_salud.smn_prestacion_servicio_medico_cabecera on smn_salud.smn_prestacion_servicio_medico_cabecera.smn_prestacion_servicio_medico_cabecera_id = smn_salud.smn_prestacion_servicio_medico_detalle.smn_prestacion_servicio_medico_cabecera_id
	left outer join smn_salud.smn_ingreso_movimiento on smn_salud.smn_ingreso_movimiento.smn_ingresos_mov_id = smn_salud.smn_prestacion_servicio_medico_detalle.smn_ingresos_mov_id
	inner join smn_salud.smn_ingresos on smn_salud.smn_ingresos.smn_ingresos_id = smn_salud.smn_prestacion_servicio_medico_cabecera.smn_ingresos_id
	--left outer join smn_base.smn_auxiliar prestador on smn_base.smn_auxiliar.smn_auxiliar_id = smn_salud.smn_prestacion_servicio_medico_detalle.smn_prestador_servicio_rf
	left outer join smn_base.smn_auxiliar paciente on paciente.smn_auxiliar_id = smn_salud.smn_ingresos.smn_auxiliar_rf
	left join smn_base.smn_servicios on smn_base.smn_servicios.smn_servicios_id = smn_salud.smn_prestacion_servicio_medico_detalle.smn_servicios_rf
	inner join smn_base.smn_tipos_servicios on smn_base.smn_tipos_servicios.smn_tipos_servicios_id = smn_base.smn_servicios.smn_tipo_servicio_rf
	left join smn_salud.smn_naturaleza_servicio on smn_salud.smn_naturaleza_servicio.smn_tipo_servicio_rf = smn_base.smn_servicios.smn_tipo_servicio_rf
	left join smn_base.smn_componentes on smn_base.smn_componentes.smn_componentes_id = smn_salud.smn_prestacion_servicio_medico_detalle.smn_componentes_rf
where
	smn_salud.smn_prestacion_servicio_medico_detalle.smn_prestacion_servicio_medico_cabecera_id = ${fld:id_cab} 
