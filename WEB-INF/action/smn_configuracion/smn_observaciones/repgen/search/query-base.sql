select
		smn_salud.smn_observaciones.smn_observaciones_id,
	${field}
from
	smn_salud.smn_observaciones
where
		smn_salud.smn_observaciones.smn_observaciones_id is not null
	${filter}
	
	
