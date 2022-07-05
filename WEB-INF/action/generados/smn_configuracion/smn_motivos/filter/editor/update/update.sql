UPDATE smn_salud.smn_motivos SET
	mtv_codigo=${fld:mtv_codigo},
	mtv_descripcion=${fld:mtv_descripcion},
	mtv_idioma='${def:locale}',
	mtv_usuario='${def:user}',
	mtv_fecha_registro={d '${def:date}'},
	mtv_hora='${def:time}'

WHERE
	smn_motivos_id=${fld:id}

