INSERT INTO smn_salud.smn_documento
(
	smn_documento_id,
	smn_tipo_documento_id,
	smn_documento_general_rf,
	doc_codigo,
	doc_nombre,
	doc_idioma,
	doc_usuario_id,
	doc_fecha_registro,
	doc_hora,
	doc_maneja_moneda_alt,
	smn_categoria_justificacion_rf,
	tca_tipo_tasa,
	doc_contratante,
	doc_afiliacion_persona_natural,
	smn_servicios_cobertura,
	smn_entidades_rf,
	smn_sucursales_rf,
	smn_caja_rf
)
VALUES
(
	${seq:currval@smn_salud.seq_smn_documento},
	${fld:smn_tipo_documento_id},
	${fld:smn_documento_general_rf},
	${fld:doc_codigo},
	${fld:doc_nombre},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}',
	${fld:doc_maneja_moneda_alt},
	${fld:smn_categoria_justificacion_rf},
	${fld:tca_tipo_tasa},
	${fld:doc_contratante},
	${fld:doc_afiliacion_persona_natural},
	${fld:smn_servicios_cobertura},
	${fld:smn_entidades_rf},
	${fld:smn_sucursales_rf},
	${fld:smn_caja_rf}

)