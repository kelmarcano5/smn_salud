select	
	smn_salud.smn_ingresos.smn_ingresos_id, 
	smn_salud.smn_ingresos.igs_num_ingreso as igs_num_ingreso_pl0,
	smn_salud.smn_prestacion_servicio_medico_cabecera.*
from
	smn_salud.smn_ingresos,
	smn_salud.smn_prestacion_servicio_medico_cabecera 
where
	smn_salud.smn_ingresos.smn_ingresos_id=smn_salud.smn_prestacion_servicio_medico_cabecera.smn_ingresos_id and
	smn_prestacion_servicio_medico_cabecera_id = ${fld:id} 
	


