INSERT INTO smn_salud.smn_rel_solicitud_pre_equipos
(
	smn_rel_solicitud_pre_equipos_id,
	smn_solicitud_presupuesto_id,
	smn_activo_fijo_rf
)
VALUES
(
	${seq:nextval@smn_salud.seq_smn_rel_solicitud_pre_equipos},
	${fld:id},
	${fld:smn_activo_fijo_rf}
)