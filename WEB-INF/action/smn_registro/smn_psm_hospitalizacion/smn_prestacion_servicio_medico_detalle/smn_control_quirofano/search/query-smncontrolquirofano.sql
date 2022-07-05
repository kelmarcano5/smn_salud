select
	smn_salud.smn_control_quirofano.smn_control_quirofano_id,
	smn_base.smn_agenda.age_descripcion as smn_agenda_rf,
	smn_salud.smn_control_quirofano.smn_presupuesto_id,
	smn_salud.smn_control_quirofano.smn_ingreso_id,
	smn_base.smn_servicios.svc_descripcion as smn_servicios_rf,
	smn_salud.smn_control_quirofano.ccq_hora_entrada,
	smn_salud.smn_control_quirofano.ccq_hora_salida,
	smn_salud.smn_control_quirofano.ccq_fecha_quirofano,
	smn_salud.smn_control_quirofano.smn_servicios_rf as servicios_id,
	smn_salud.smn_habitaciones.hab_descripcion as smn_habitaciones_id,
	smn_salud.smn_control_quirofano.ccq_cantidad_horas,
	smn_salud.smn_control_quirofano.ccq_fecha_registro
	
from
	smn_salud.smn_control_quirofano
	inner join smn_base.smn_agenda on smn_base.smn_agenda.smn_agenda_id = smn_salud.smn_control_quirofano.smn_agenda_rf
	inner join smn_base.smn_servicios on smn_base.smn_servicios.smn_servicios_id = smn_salud.smn_control_quirofano.smn_servicios_rf
	inner join smn_salud.smn_ingresos on smn_salud.smn_ingresos.smn_ingresos_id = smn_salud.smn_control_quirofano.smn_ingreso_id
	left join smn_salud.smn_presupuesto on smn_salud.smn_presupuesto.smn_presupuesto_id = smn_salud.smn_control_quirofano.smn_presupuesto_id
	inner join smn_salud.smn_habitaciones on smn_salud.smn_habitaciones.smn_habitaciones_id = smn_salud.smn_control_quirofano.smn_habitaciones_id
where
	smn_salud.smn_control_quirofano.smn_prestacion_servicio_medico_detalle_id=${fld:id_prestacion_det}
