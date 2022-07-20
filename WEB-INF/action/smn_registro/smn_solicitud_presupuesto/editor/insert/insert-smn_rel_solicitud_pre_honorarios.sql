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
	smn_moneda_id
)
VALUES
(
	${seq:nextval@smn_salud.seq_smn_rel_solicitud_pre_honorarios},
	${seq:currval@smn_salud.seq_smn_solicitud_presupuesto},
	${fld:smn_servicios_rf},
	${fld:smn_componentes_rf},
	${fld:smn_grupo_prestador_servicio_rf},
	${fld:smn_prestador_serviciorf},
	${fld:rsh_monto_solicitado_ml},
	${fld:rsh_monto_solicitado_ma},
	${fld:smn_tasa_id},
	${fld:smn_moneda_id}
)

-- INSERT INTO smn_salud.smn_rel_plan_quirurgico_patologia
-- (
-- 	smn_rel_plan_quirurgico_patologia_id,
-- 	smn_plan_quirurgico_id,
-- 	smn_patologias_id
-- )
-- VALUES
-- (
-- 	${seq:nextval@smn_salud.seq_smn_rel_plan_quirurgico_patologia},
-- 	${seq:currval@smn_salud.seq_smn_plan_quirurgico},
-- 	${fld:smn_patologias_id}
-- )