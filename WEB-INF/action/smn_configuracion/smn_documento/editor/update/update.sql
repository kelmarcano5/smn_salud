UPDATE smn_salud.smn_documento SET
	smn_tipo_documento_id=${fld:smn_tipo_documento_id},
	smn_documento_general_rf=${fld:smn_documento_general_rf},
	doc_codigo=${fld:doc_codigo},
	doc_nombre=${fld:doc_nombre},
	doc_idioma='${def:locale}',
	doc_usuario_id='${def:user}',
	doc_fecha_registro={d '${def:date}'},
	doc_hora='${def:time}',
	doc_maneja_moneda_alt=${fld:doc_maneja_moneda_alt},
	smn_categoria_justificacion_rf=${fld:smn_categoria_justificacion_rf},
	tca_tipo_tasa=${fld:tca_tipo_tasa},
	doc_contratante=${fld:doc_contratante},
	doc_afiliacion_persona_natural=${fld:doc_afiliacion_persona_natural},
	smn_servicios_cobertura=${fld:smn_servicios_cobertura},
	smn_entidades_rf=${fld:smn_entidades_rf},
	smn_sucursales_rf=${fld:smn_sucursales_rf},
	smn_caja_rf=${fld:smn_caja_rf}

WHERE
	smn_documento_id=${fld:id}

