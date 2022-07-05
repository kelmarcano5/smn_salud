select
		smn_salud.smn_seguimiento.smn_seguimiento_id,
	${field}
from
	smn_salud.smn_seguimiento
where
		smn_salud.smn_seguimiento.smn_seguimiento_id is not null
	${filter}
	
	
