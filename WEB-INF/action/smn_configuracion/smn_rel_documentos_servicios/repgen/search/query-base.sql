select
		smn_salud.smn_rel_documentos_servicios.smn_rel_documentos_servicios_id,
	${field}
from
	smn_salud.smn_rel_documentos_servicios
where
		smn_salud.smn_rel_documentos_servicios.smn_rel_documentos_servicios_id is not null
	${filter}
	
	
