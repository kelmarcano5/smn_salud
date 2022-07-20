select	
	smn_salud.smn_patologia.*
from
	smn_salud.smn_patologia 
where
	smn_patologia_id is not null
	${filter}