UPDATE smn_salud.smn_marca_comercial SET
	mac_codigo=${fld:mac_codigo},
	mac_descripcion=${fld:mac_descripcion},
	mac_idioma='${def:locale}',
	mac_usuario_id='${def:user}',
	mac_fecha_registro={d '${def:date}'},
	mac_hora='${def:time}'

WHERE
	smn_marca_comercial_id=${fld:id}

