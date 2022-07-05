INSERT INTO smn_salud.smn_rel_tipodoc_patologia
(
	smn_rel_tipodoc_patologia_id,
	smn_tipo_documento_id,
	smn_patologia_id
)
VALUES
(
	${seq:currval@smn_salud.seq_smn_rel_tipodoc_patologia},
	${fld:smn_tipo_documento_id},
	${fld:smn_patologia_id}
)
