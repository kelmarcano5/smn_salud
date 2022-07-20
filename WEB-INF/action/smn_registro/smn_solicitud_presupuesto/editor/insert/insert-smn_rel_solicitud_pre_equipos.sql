INSERT INTO smn_salud.smn_rel_solicitud_pre_equipos
(
	smn_rel_solicitud_pre_equipos_id,
	smn_solicitud_presupuesto_id,
	smn_activo_fijo_rf
)
VALUES
(
	${seq:nextval@smn_salud.seq_smn_rel_solicitud_pre_equipos},
	${seq:currval@smn_salud.seq_smn_solicitud_presupuesto},
	${fld:smn_activo_fijo_rf}
)

-- INSERT INTO smn_salud.smn_rel_plan_quirurgico_activo_fijo
-- (
-- 	smn_rel_plan_quirurgico_activo_fijo_id,
-- 	smn_plan_quirurgico_id,
-- 	smn_activo_fijo_rf
-- )
-- VALUES
-- (
-- 	${seq:nextval@smn_salud.seq_smn_rel_plan_quirurgico_activo_fijo},
-- 	${seq:nextval@smn_salud.seq_smn_plan_quirurgico},
-- 	${fld:smn_activo_fijo_rf}
-- );