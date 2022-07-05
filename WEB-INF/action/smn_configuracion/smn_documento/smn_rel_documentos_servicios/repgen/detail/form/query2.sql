select
		smn_salud.smn_rel_documentos_servicios.smn_documentos_id,
	smn_salud.smn_rel_documentos_servicios.smn_servicios_id,
	smn_salud.smn_rel_documentos_servicios.rdt_tipo_generacion
from
	smn_salud.smn_rel_documentos_servicios 
where
	smn_salud.smn_rel_documentos_servicios.smn_rel_documentos_servicios_id = ${fld:id}
