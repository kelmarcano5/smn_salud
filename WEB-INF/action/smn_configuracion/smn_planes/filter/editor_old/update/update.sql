UPDATE smn_salud.smn_planes SET
	pla_codigo=${fld:pla_codigo},
	pla_descripcion=${fld:pla_descripcion},
	pla_vigencia_desde=${fld:pla_vigencia_desde},
	pla_vigencia_hasta=${fld:pla_vigencia_hasta},
	pla_inactivo=${fld:pla_inactivo},
	pla_modelo_contrato=${fld:pla_modelo_contrato},
	pla_empresa=${fld:pla_empresa},
	pla_idioma='${def:locale}',
	pla_usuario='${def:user}',
	pla_fecha_registro={d '${def:date}'},
	pla_hora='${def:time}'

WHERE
	smn_planes_id=${fld:id}

