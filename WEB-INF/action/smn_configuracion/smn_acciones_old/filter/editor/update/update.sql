UPDATE smn_salud.smn_acciones SET
	acc_codigo=${fld:acc_codigo},
	acc_descripcion=${fld:acc_descripcion},
	acc_idioma='${def:locale}',
	acc_usuario='${def:user}',
	acc_fecha_registro={d '${def:date}'},
	acc_hora='${def:time}'

WHERE
	smn_acciones_id=${fld:id}

