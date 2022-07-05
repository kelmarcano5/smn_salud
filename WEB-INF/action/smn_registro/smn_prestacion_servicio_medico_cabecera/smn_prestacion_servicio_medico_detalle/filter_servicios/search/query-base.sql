select DISTINCT
	smn_salud.smn_prestacion_servicio_medico_detalle.smn_prestacion_servicio_medico_detalle_id,
	paciente.aux_descripcion, 
	smn_base.smn_servicios.svc_descripcion as servicio,
	smn_salud.smn_ingresos.smn_auxiliar_rf as paciente_id,
	smn_base.smn_tipos_servicios.tsr_descripcion as tipo_servicio,
		case
		when smn_salud.smn_prestacion_servicio_medico_detalle.psd_estatus='RE' then '${lbl:b_register}'
		when smn_salud.smn_prestacion_servicio_medico_detalle.psd_estatus='AP' then '${lbl:b_aprobated}'
		when smn_salud.smn_prestacion_servicio_medico_detalle.psd_estatus='RZ' then '${lbl:b_not_aprobated}'
		when smn_salud.smn_prestacion_servicio_medico_detalle.psd_estatus='AC' then '${lbl:b_active}'
		when smn_salud.smn_prestacion_servicio_medico_detalle.psd_estatus='AT' then 'Atendido'
	end as estatus,
	smn_salud.smn_prestacion_servicio_medico_detalle.psd_fecha_registro
from
	smn_salud.smn_prestacion_servicio_medico_detalle
	inner join smn_salud.smn_prestacion_servicio_medico_cabecera on smn_salud.smn_prestacion_servicio_medico_cabecera.smn_prestacion_servicio_medico_cabecera_id = smn_salud.smn_prestacion_servicio_medico_detalle.smn_prestacion_servicio_medico_cabecera_id
	inner join smn_salud.smn_ingresos on smn_salud.smn_ingresos.smn_ingresos_id = smn_salud.smn_prestacion_servicio_medico_cabecera.smn_ingresos_id
	left outer join smn_base.smn_auxiliar paciente on paciente.smn_auxiliar_id = smn_salud.smn_ingresos.smn_auxiliar_rf
	left join smn_base.smn_servicios on smn_base.smn_servicios.smn_servicios_id = smn_salud.smn_prestacion_servicio_medico_detalle.smn_servicios_rf
	inner join smn_base.smn_tipos_servicios on smn_base.smn_tipos_servicios.smn_tipos_servicios_id = smn_base.smn_servicios.smn_tipo_servicio_rf
	left join smn_salud.smn_naturaleza_servicio on smn_salud.smn_naturaleza_servicio.smn_tipo_servicio_rf = smn_base.smn_servicios.smn_tipo_servicio_rf
	left join smn_base.smn_componentes on smn_base.smn_componentes.smn_componentes_id = smn_salud.smn_prestacion_servicio_medico_detalle.smn_componentes_rf
where
	smn_prestacion_servicio_medico_detalle_id is not null and 
	smn_salud.smn_ingresos.smn_auxiliar_rf=${fld:smn_auxiliar_rf}
	--and
	--smn_salud.smn_prestacion_servicio_medico_detalle.smn_prestacion_servicio_medico_cabecera_id = ${fld:id2}
	${filter} 
order by
		smn_prestacion_servicio_medico_detalle_id
