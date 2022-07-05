UPDATE smn_salud.smn_origen SET
	ori_codigo=${fld:ori_codigo},
	ori_descripcion=${fld:ori_descripcion},
	ori_tipo=${fld:ori_tipo},
	ori_idioma='${def:locale}',
	ori_usuario='${def:user}',
	ori_fecha_registro={d '${def:date}'},
	ori_hora='${def:time}'

WHERE
	smn_origen_id=${fld:id}

