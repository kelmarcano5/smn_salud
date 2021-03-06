INSERT INTO smn_salud.smn_reposos_constancias
(
	smn_reposos_constancias_id,
	smn_ingreso_id,
	smn_auxiliar_rf,
	smn_diagnostico_rf,
	rpc_fecha_desde,
	rpc_fecha_hasta,
	rpc_fecha_reintegro,
	rpc_motivo,
	rpc_observacion,
	rpc_idioma,
	rpc_usuario,
	rpc_fecha_registro,
	rpc_hora
)
VALUES
(
	${seq:currval@smn_salud.seq_smn_reposos_constancias},
	${fld:smn_ingreso_id},
	${fld:smn_auxiliar_rf},
	${fld:smn_diagnostico_rf},
	${fld:rpc_fecha_desde},
	${fld:rpc_fecha_hasta},
	${fld:rpc_fecha_reintegro},
	${fld:rpc_motivo},
	${fld:rpc_observacion},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
