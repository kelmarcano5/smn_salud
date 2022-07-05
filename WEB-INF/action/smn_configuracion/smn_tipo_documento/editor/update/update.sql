UPDATE smn_salud.smn_tipo_documento SET
	tdc_codigo=${fld:tdc_codigo},
	tdc_nombre=${fld:tdc_nombre},
	tdc_naturaleza=${fld:tdc_naturaleza},
	tdc_idioma='${def:locale}',
	tdc_usuario_id='${def:user}',
	tdc_fecha_registro={d '${def:date}'},
	tdc_hora='${def:time}'

WHERE
	smn_tipo_documento_id=${fld:id}

