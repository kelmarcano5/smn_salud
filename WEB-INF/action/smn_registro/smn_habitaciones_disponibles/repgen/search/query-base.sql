select
		smn_salud.smn_habitaciones_disponibles.smn_habitaciones_disponibles_id,
	${field}
from
	smn_salud.smn_habitaciones_disponibles
where
		smn_salud.smn_habitaciones_disponibles.smn_habitaciones_disponibles_id is not null
	${filter}
	
	
