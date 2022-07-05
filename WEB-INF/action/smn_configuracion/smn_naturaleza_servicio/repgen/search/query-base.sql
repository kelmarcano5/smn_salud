select
		smn_salud.smn_naturaleza_servicio.smn_naturaleza_servicio_id,
	${field}
from
	smn_salud.smn_naturaleza_servicio
where
		smn_salud.smn_naturaleza_servicio.smn_naturaleza_servicio_id is not null
	${filter}
	
	
