UPDATE smn_salud.smn_estatus SET
	sta_codigo=${fld:sta_codigo},
	sta_descripcion=${fld:sta_descripcion},
	sta_cod_siguiente=${fld:sta_cod_siguiente},
	sta_idioma='${def:locale}',
	sta_usuario='${def:user}',
	sta_fecha_registro={d '${def:date}'},
	sta_hora='${def:time}'

WHERE
	smn_estatus_id=${fld:id}

