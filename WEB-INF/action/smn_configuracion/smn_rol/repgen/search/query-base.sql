select
		smn_salud.smn_rol.smn_rol_id,
	${field}
from
	smn_salud.smn_rol
where
		smn_salud.smn_rol.smn_rol_id is not null
	${filter}
	
	
