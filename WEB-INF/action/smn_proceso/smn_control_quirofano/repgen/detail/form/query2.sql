select
		smn_salud.smn_control_quirofano.smn_agenda_rf,
	smn_salud.smn_control_quirofano.smn_presupuesto_id,
	smn_salud.smn_control_quirofano.smn_ingreso_id,
	smn_salud.smn_control_quirofano.smn_prestacion_servicio_cabecera_id,
	smn_salud.smn_control_quirofano.smn_prestaci�n_servicio_medico_detalle_id,
	smn_salud.smn_control_quirofano.smn_servicios_rf,
	smn_salud.smn_control_quirofano.ccq_fecha_quirofano,
	smn_salud.smn_control_quirofano.smn_habitaciones_id,
	smn_salud.smn_control_quirofano.smn_unidad_medida_rf,
	smn_salud.smn_control_quirofano.ccq_fecha_registro
from
	smn_salud.smn_control_quirofano 
where
	smn_salud.smn_control_quirofano.smn_control_quirofano_id = ${fld:id}
