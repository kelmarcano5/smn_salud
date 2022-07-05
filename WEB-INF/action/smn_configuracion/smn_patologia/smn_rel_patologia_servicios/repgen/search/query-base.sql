select
		smn_salud.smn_rel_patologia_servicios.smn_rel_patologia_servicios_id,
	${field}
from
	smn_salud.smn_rel_patologia_servicios
where
		smn_salud.smn_rel_patologia_servicios.smn_rel_patologia_servicios_id is not null
	${filter}
	
	
