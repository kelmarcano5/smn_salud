select
		smn_salud.smn_diagnostico.smn_diagnostico_id,
	${field}
from
	smn_salud.smn_diagnostico
where
		smn_salud.smn_diagnostico.smn_diagnostico_id is not null
	${filter}
	
	
