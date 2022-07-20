INSERT INTO smn_salud.smn_rel_solicitud_pre_servicios
(
	smn_rel_solicitud_pre_servicios_id,
	smn_solicitud_presupuesto_id,
	smn_servicios_rf
)
VALUES
(
	${seq:nextval@smn_salud.seq_smn_rel_solicitud_pre_servicios},
	${fld:id},
	${fld:smn_servicios_rf}
)