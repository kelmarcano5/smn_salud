UPDATE smn_salud.smn_prestacion_servicio_medico_detalle SET
	smn_prestador_servicio_rf=(select smn_base.smn_prestadores_servicios.smn_prestadores_servicios_id from smn_base.smn_prestadores_servicios
inner join smn_base.smn_usuarios on smn_base.smn_usuarios.smn_auxiliar_rf = smn_base.smn_prestadores_servicios.prs_auxiliar
inner join smn_seguridad.s_user on smn_seguridad.s_user.user_id=smn_base.smn_usuarios.smn_user_rf
where 
	smn_seguridad.s_user.userlogin='${def:user}'),
	psd_idioma='${def:locale}',
	psd_usuario='${def:user}',
	psd_fecha_registro={d '${def:date}'},
	psd_hora='${def:time}'

WHERE
	smn_prestacion_servicio_medico_detalle_id=${fld:id}

