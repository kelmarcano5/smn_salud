select
		smn_salud.smn_patologia.smn_patologia_id,
	${field}
from
	smn_salud.smn_patologia
where
		smn_salud.smn_patologia.smn_patologia_id is not null
	${filter}
	
	
