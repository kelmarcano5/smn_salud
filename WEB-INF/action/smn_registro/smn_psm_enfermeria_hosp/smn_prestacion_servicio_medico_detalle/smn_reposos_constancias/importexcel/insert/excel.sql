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
	rpc_fecha_registro
)
VALUES
(
	${seq:nextval@smn_salud.seq_smn_reposos_constancias},
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	{d '${def:date}'}
)
