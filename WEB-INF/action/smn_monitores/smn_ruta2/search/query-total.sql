select	

	COALESCE(SUM(CASE WHEN rta_estatus  in ('PE','ER') THEN 1 ELSE 0 END),0) as tpacientes_pendientes,
	to_char(((COALESCE(SUM(CASE WHEN rta_estatus  in ('PE','ER') THEN rta_hora_salida_unidad-rta_hora_llegada_unidad ELSE NULL END),'00:00:00'))::time),'MI.SS') as ttiempo_pacientes_pendientes,
	COALESCE(SUM(CASE WHEN rta_estatus = 'AT' THEN 1 ELSE 0 END),0) as tpacientes_atendidos,
	to_char(((COALESCE(SUM(CASE WHEN rta_estatus = 'AT' THEN rta_hora_salida_unidad-rta_hora_llegada_unidad ELSE NULL END),'00:00:00'))::time),'MI.SS') as ttiempo_pacientes_atendidos,
	COALESCE(SUM(CASE WHEN rta_estatus = 'EA' THEN 1 ELSE 0 END),0) as tpacientes_en_atencion,
	to_char(((COALESCE(SUM(CASE WHEN rta_estatus = 'EA' THEN rta_hora_salida_unidad-rta_hora_llegada_unidad ELSE NULL END),'00:00:00'))::time),'MI.SS') as ttiempo_pacientes_en_atencion,
	COALESCE(SUM(CASE WHEN rta_estatus = 'IN' THEN 1 ELSE 0 END),0) as tpacientes_informados,
	to_char(((COALESCE(SUM(CASE WHEN rta_estatus = 'IN' THEN rta_hora_salida_unidad-rta_hora_llegada_unidad ELSE NULL END),'00:00:00'))::time),'MI.SS') as ttiempo_pacientes_informado,
	COUNT(smn_ruta_id) as ttotal_pacientes,
	to_char(((COALESCE(SUM(rta_hora_salida_unidad-rta_hora_llegada_unidad),'00:00:00'))::time),'MI.SS') as ttotal_tiempo,
	COALESCE(SUM(CASE WHEN rta_estatus = 'EG' THEN 1 ELSE 0 END),0) as tpacientes_retirados
from
	smn_salud.smn_ruta_paciente
	inner join smn_base.smn_unidades_servicios on smn_base.smn_unidades_servicios.smn_unidades_servicios_id=smn_salud.smn_ruta_paciente.smn_unidad_servicio_rf
	inner join smn_salud.smn_ingresos on smn_salud.smn_ingresos.igs_ticket=smn_salud.smn_ruta_paciente.rta_ticket
	and smn_salud.smn_ruta_paciente.rta_fecha_registro=smn_salud.smn_ingresos.igs_fecha_registro 
	and smn_salud.smn_ruta_paciente.rta_secuencia=1
where
	smn_ruta_id is not null	
 	 	${filter}
