INSERT INTO smn_salud.smn_rel_solicitud_pre_servicios
(
	smn_rel_solicitud_pre_servicios_id,
	smn_solicitud_presupuesto_id,
	smn_servicios_rf
)
VALUES
(
	${seq:nextval@smn_salud.seq_smn_rel_solicitud_pre_servicios},
	${seq:currval@smn_salud.seq_smn_solicitud_presupuesto},
	${fld:smn_servicios_rf}
)

-- INSERT INTO smn_salud.smn_rel_plan_quirurgico_servicios
-- (
-- 	smn_rel_plan_quirurgico_servicios_id,
-- 	smn_plan_quirurgico_id,
-- 	smn_servicios_rf,
-- 	smn_componente_rf,
-- 	smn_grupo_prestador_servicio_rf
-- )
-- VALUES
-- (
-- 	${seq:nextval@smn_salud.seq_smn_rel_plan_quirurgico_servicios},
-- 	${seq:nextval@smn_salud.seq_smn_plan_quirurgico},
-- 	${fld:smn_servicios_rf},
-- 	0,
-- 	0
-- )