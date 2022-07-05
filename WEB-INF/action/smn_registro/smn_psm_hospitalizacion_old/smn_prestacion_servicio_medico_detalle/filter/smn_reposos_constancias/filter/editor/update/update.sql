UPDATE smn_salud.smn_reposos_constancias SET
	smn_ingreso_id=${fld:smn_ingreso_id},
	smn_auxiliar_rf=${fld:smn_auxiliar_rf},
	smn_diagnostico_rf=${fld:smn_diagnostico_rf},
	rpc_fecha_desde=${fld:rpc_fecha_desde},
	rpc_fecha_hasta=${fld:rpc_fecha_hasta},
	rpc_fecha_reintegro=${fld:rpc_fecha_reintegro},
	rpc_motivo=${fld:rpc_motivo},
	rpc_observacion=${fld:rpc_observacion},
	rpc_idioma='${def:locale}',
	rpc_usuario='${def:user}',
	rpc_fecha_registro={d '${def:date}'},
	rpc_hora='${def:time}',
	rpc_estatus=${fld:rpc_estatus},
	smn_medico_auxiliar_rf=${fld:smn_medico_auxiliar_rf},
	rpc_entidad_emisora=${fld:rpc_entidad_emisora},
	rpc_emision_certificacion=${fld:rpc_emision_certificacion},
	rpc_numero_reposo_certificado=${fld:rpc_numero_reposo_certificado},
	rpc_numero_sanidad=${fld:rpc_numero_sanidad}

WHERE
	smn_reposos_constancias_id=${fld:id}

