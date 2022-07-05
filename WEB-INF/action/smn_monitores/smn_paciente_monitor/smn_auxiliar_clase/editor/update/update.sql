UPDATE smn_base.smn_auxiliar_clase SET
	smn_auxiliar_id=${fld:smn_auxiliar_id},
	smn_clase_auxiliar_id=${fld:smn_clase_auxiliar_id},
	acl_idioma='${def:locale}',
	acl_usuario='${def:user}',
	acl_fecha_registro={d '${def:date}'},
	acl_hora='${def:time}'

WHERE
	smn_auxiliar_clase_id=${fld:id}

