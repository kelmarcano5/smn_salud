select
		smn_salud.smn_tramos.smn_tramos_id,
	${field}
from
	smn_salud.smn_tramos
where
		smn_salud.smn_tramos.smn_tramos_id is not null
	${filter}
	
	
