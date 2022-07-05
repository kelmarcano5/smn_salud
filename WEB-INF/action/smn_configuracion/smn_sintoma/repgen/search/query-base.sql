select
		smn_salud.smn_sintoma.smn_sintoma_id,
	${field}
from
	smn_salud.smn_sintoma
where
		smn_salud.smn_sintoma.smn_sintoma_id is not null
	${filter}
	
	
