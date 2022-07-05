select
		smn_salud.smn_ingreso.smn_ingreso_id,
	${field}
from
	smn_salud.smn_ingreso
where
		smn_salud.smn_ingreso.smn_ingreso_id is not null
	${filter}
	
	
