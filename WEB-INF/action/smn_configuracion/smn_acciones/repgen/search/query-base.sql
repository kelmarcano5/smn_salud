select
		smn_salud.smn_acciones.smn_acciones_id,
	${field}
from
	smn_salud.smn_acciones
where
		smn_salud.smn_acciones.smn_acciones_id is not null
	${filter}
	
	
