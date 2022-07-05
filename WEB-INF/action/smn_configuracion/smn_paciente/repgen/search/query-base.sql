select
		smn_salud.smn_paciente.smn_paciente_id,
	${field}
from
	smn_salud.smn_paciente
where
		smn_salud.smn_paciente.smn_paciente_id is not null
	${filter}
	
	
