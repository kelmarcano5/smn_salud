select	
	(select smn_salud.smn_documento.doc_codigo|| ' - ' || smn_salud.smn_documento.doc_nombre from  smn_salud.smn_documento  where smn_salud.smn_documento.smn_documento_id is not null  and smn_salud.smn_documento.smn_documento_id=smn_salud.smn_rel_documentos_servicios.smn_documentos_id  order by smn_salud.smn_documento.doc_nombre ) as smn_documentos_id_combo,
	(select smn_base.smn_servicios.svc_codigo || ' - ' || smn_base.smn_servicios.svc_descripcion from  smn_base.smn_servicios  where smn_base.smn_servicios.smn_servicios_id is not null  and smn_base.smn_servicios.smn_servicios_id=smn_salud.smn_rel_documentos_servicios.smn_servicios_id  order by smn_base.smn_servicios.svc_descripcion asc ) as smn_servicios_id_combo,
	case
		when smn_salud.smn_rel_documentos_servicios.rdt_tipo_generacion=IN then '${lbl:b_ingreso}'
		when smn_salud.smn_rel_documentos_servicios.rdt_tipo_generacion=DI then '${lbl:b_diaria}'
	end as rdt_tipo_generacion_combo,
	smn_salud.smn_rel_documentos_servicios.smn_documentos_id,
	smn_salud.smn_rel_documentos_servicios.smn_servicios_id,
	smn_salud.smn_rel_documentos_servicios.rdt_tipo_generacion,
	smn_salud.smn_rel_documentos_servicios.rdt_hora_generacion,
	smn_salud.smn_rel_documentos_servicios.smn_rel_documentos_servicios_id

from
	smn_salud.smn_rel_documentos_servicios
where
	smn_rel_documentos_servicios_id is not null	
 	 	${filter}
order by 
	smn_rel_documentos_servicios_id