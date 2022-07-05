select
		smn_salud.smn_ruta_paciente.smn_ruta_id,
	smn_salud.smn_ruta_paciente.smn_ingreso_cola_virtual_id,
	smn_salud.smn_ruta_paciente.smn_clase_auxiliar_rf,
	smn_salud.smn_ruta_paciente.smn_auxiliar_rf,
	smn_salud.smn_ruta_paciente.rta_numero_documento_identidad,
	smn_salud.smn_ruta_paciente.smn_serie_id,
	smn_salud.smn_ruta_paciente.rta_ticket,
	smn_salud.smn_ruta_paciente.rta_fecha_registro
from
	smn_salud.smn_ruta_paciente 
where
	smn_salud.smn_ruta_paciente.smn_ruta_id = ${fld:id}
