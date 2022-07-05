UPDATE smn_salud.smn_documento_afiliados SET
	smn_tipo_documento_afiliado_id=${fld:smn_tipo_documento_afiliado_id},
	smn_afiliados_id=${fld:smn_afiliados_id},
	doc_archivo=${fld:doc_archivo},
	doc_descripcion=${fld:doc_descripcion},
	doc_idioma='${def:locale}',
	doc_usuario='${def:user}',
	doc_fecha_registro={d '${def:date}'},
	doc_hora='${def:time}'

WHERE
	smn_documento_afiliados_id=${fld:id}

