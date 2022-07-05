select
		smn_salud.smn_rel_documentos_servicios.smn_rel_documentos_servicios_id,
	case
	when smn_salud.smn_rel_documentos_servicios.rdt_tipo_generacion='IN' then '${lbl:b_ingreso}'
	when smn_salud.smn_rel_documentos_servicios.rdt_tipo_generacion='DI' then '${lbl:b_diaria}'
	end as rdt_tipo_generacion,
	smn_salud.smn_documento.doc_codigo ||' - '|| smn_salud.smn_documento.doc_nombre as smn_documentos_id,
	smn_base.smn_servicios.svc_codigo ||' - '|| smn_base.smn_servicios.svc_descripcion as smn_servicios_id,
	smn_salud.smn_rel_documentos_servicios.rdt_hora_generacion
	
from
	smn_salud.smn_rel_documentos_servicios
	inner join smn_base.smn_servicios on smn_base.smn_servicios.smn_servicios_id = smn_salud.smn_rel_documentos_servicios.smn_servicios_id
	inner join smn_salud.smn_documento on smn_salud.smn_documento.smn_documento_id = smn_salud.smn_rel_documentos_servicios.smn_documentos_id
