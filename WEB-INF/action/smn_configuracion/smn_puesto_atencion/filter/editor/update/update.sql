UPDATE smn_salud.smn_puesto_atencion SET
	put_codigo=${fld:put_codigo},
	put_descripcion=${fld:put_descripcion},
	put_estatus=${fld:put_estatus},
	put_idioma='${def:locale}',
	put_usuario='${def:user}',
	put_fecha_registro={d '${def:date}'},
	put_hora='${def:time}'

WHERE
	smn_puesto_atencion_id=${fld:id}

