select
		smn_salud.smn_rel_orden_medica_servicios.smn_rel_orden_medica_servicios_id,
	${field}
from
	smn_salud.smn_rel_orden_medica_servicios
where
		smn_salud.smn_rel_orden_medica_servicios.smn_rel_orden_medica_servicios_id is not null
	${filter}
	
	
