select
		smn_salud.smn_tramos_descanso.smn_tramo_descanso_id,
	${field}
from
	smn_salud.smn_tramos_descanso
where
		smn_salud.smn_tramos_descanso.smn_tramo_descanso_id is not null
	${filter}
	
	
