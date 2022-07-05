select
		smn_salud.smn_estatus.smn_estatus_id,
	${field}
from
	smn_salud.smn_estatus
where
		smn_salud.smn_estatus.smn_estatus_id is not null
	${filter}
	
	
