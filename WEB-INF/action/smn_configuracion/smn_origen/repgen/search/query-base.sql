select
		smn_salud.smn_origen.smn_origen_id,
	${field}
from
	smn_salud.smn_origen
where
		smn_salud.smn_origen.smn_origen_id is not null
	${filter}
	
	
