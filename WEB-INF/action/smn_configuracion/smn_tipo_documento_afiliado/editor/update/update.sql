UPDATE smn_salud.smn_tipo_documento_afiliado SET
	tdo_codigo=${fld:tdo_codigo},
	tdo_descripcion=${fld:tdo_descripcion},
	tdo_idioma='${def:locale}',
	tdo_usuario='${def:user}',
	tdo_fecha_registro={d '${def:date}'},
	tdo_hora='${def:time}'

WHERE
	smn_tipo_documento_afiliado_id=${fld:id}

