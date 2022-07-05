UPDATE smn_salud.smn_relacionados SET
	smn_afiliados_id=${fld:smn_afiliados_id},
	smn_documento_id=${fld:smn_documento_id},
	rel_numero_control=${fld:rel_numero_control},
	smn_clase_rf=${fld:smn_clase_rf},
	smn_auxiliar_rf=${fld:smn_auxiliar_rf},
	smn_parentesco_rf=${fld:smn_parentesco_rf},
	smn_numero_hijo=${fld:smn_numero_hijo},
	rel_idioma='${def:locale}',
	rel_usuario_id='${def:user}',
	rel_fecha_registro={d '${def:date}'},
	rel_hora='${def:time}'

WHERE
	smn_relacionado_id=${fld:id}

