INSERT INTO smn_salud.smn_rel_solicitud_pre_patologias
(
	smn_rel_solicitud_pre_patologias_id,
	smn_solicitud_presupuesto_id,
	smn_patologias_id
)
VALUES
(
	${seq:nextval@smn_salud.seq_smn_rel_solicitud_pre_patologias},
	${seq:currval@smn_salud.seq_smn_solicitud_presupuesto},
	${fld:smn_patologia_id}
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