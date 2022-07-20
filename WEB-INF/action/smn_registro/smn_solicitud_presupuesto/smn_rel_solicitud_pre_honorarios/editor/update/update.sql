UPDATE smn_salud.smn_rel_solicitud_pre_honorarios SET
	smn_solicitud_presupuesto_id=${fld:smn_solicitud_presupuesto_id},
	smn_servicios_rf=${fld:smn_servicios_rf},
	smn_componentes_rf=${fld:smn_componentes_rf},
	smn_grupo_prestador_servicio_rf=${fld:smn_grupo_prestador_servicio_rf},
	smn_prestador_serviciorf=${fld:smn_prestador_serviciorf},
	rsh_monto_solicitado_ml=${fld:rsh_monto_solicitado_ml},
	rsh_monto_solicitado_ma=${fld:rsh_monto_solicitado_ma},
	smn_tasa_id=${fld:smn_tasa_id},
	smn_moneda_id=${fld:smn_moneda_id},
	rsh_idioma='${def:locale}',
	rsh_usuario='${def:user}',
	rsh_fecha_registro={d '${def:date}'},
	rsh_hora='${def:time}'

WHERE
	smn_rel_solicitud_pre_honorarios_id=${fld:id}

