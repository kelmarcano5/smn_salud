UPDATE smn_salud.smn_tipo_coberturas SET
	tco_codigo=${fld:tco_codigo},
	tco_descripcion=${fld:tco_descripcion},
	tco_idioma='${def:locale}',
	tco_usuario='${def:user}',
	tco_fecha_registro={d '${def:date}'},
	tco_hora='${def:time}'

WHERE
	smn_tipo_coberturas_id=${fld:id}

