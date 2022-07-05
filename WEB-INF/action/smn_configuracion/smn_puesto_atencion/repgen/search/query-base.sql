select
		smn_salud.smn_puesto_atencion.smn_puesto_atencion_id,
	${field}
from
	smn_salud.smn_puesto_atencion
where
		smn_salud.smn_puesto_atencion.smn_puesto_atencion_id is not null
	${filter}
	
	
