select
		smn_salud.smn_control_quirofano.smn_control_quirofano_id,
	${field}
from
	smn_salud.smn_control_quirofano
where
		smn_salud.smn_control_quirofano.smn_control_quirofano_id is not null
	${filter}
	
	
