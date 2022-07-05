select
		smn_salud.smn_horario.smn_horarios_id,
	${field}
from
	smn_salud.smn_horario
where
		smn_salud.smn_horario.smn_horarios_id is not null
	${filter}
	
	
