INSERT INTO smn_salud.smn_rel_solicitud_pre_honorarios
(
	smn_rel_solicitud_pre_honorarios_id,
	smn_solicitud_presupuesto_id,
	smn_servicios_rf,
	smn_componentes_rf,
	smn_grupo_prestador_servicio_rf,
	smn_prestador_serviciorf,
	rsh_monto_solicitado_ml,
	rsh_monto_solicitado_ma,
	smn_tasa_id,
	smn_moneda_id,
	rsh_fecha_registro
)
VALUES
(
	${seq:nextval@smn_salud.seq_smn_rel_solicitud_pre_honorarios},
	?,
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
