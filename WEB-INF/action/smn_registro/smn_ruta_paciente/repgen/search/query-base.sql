select
		smn_salud.smn_ruta_paciente.smn_ruta_id,
	${field}
from
	smn_salud.smn_ruta_paciente
where
		smn_salud.smn_ruta_paciente.smn_ruta_id is not null
	${filter}
	
	
