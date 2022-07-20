INSERT INTO smn_salud.smn_rel_solicitud_pre_patologias
(
	smn_rel_solicitud_pre_patologias_id,
	smn_solicitud_presupuesto_id,
	smn_patologias_id
)
VALUES
(
	${seq:nextval@smn_salud.seq_smn_rel_solicitud_pre_patologias},
	${fld:id},
	${fld:smn_patologia_id}
)
