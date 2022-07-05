select	
	smn_salud.smn_documento_afiliados.smn_tipo_documento_afiliado_id,
	smn_salud.smn_documento_afiliados.smn_afiliados_id,
	smn_salud.smn_documento_afiliados.doc_archivo,
	smn_salud.smn_documento_afiliados.doc_descripcion,
	smn_salud.smn_documento_afiliados.smn_documento_afiliados_id

from 
	smn_salud.smn_documento_afiliados
where 
	smn_documento_afiliados_id = ${fld:id}


