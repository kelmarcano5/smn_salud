UPDATE smn_salud.smn_estatus_citas SET
	eci_num_secuencia=${fld:eci_num_secuencia},
	eci_descripcion=${fld:eci_descripcion},
	eci_aplica=${fld:eci_aplica},
	eci_idioma='${def:locale}',
	eci_usuario='${def:user}',
	eci_fecha_registro={d '${def:date}'},
	eci_hora='${def:time}'

WHERE
	smn_estatus_citas_id=${fld:id}

