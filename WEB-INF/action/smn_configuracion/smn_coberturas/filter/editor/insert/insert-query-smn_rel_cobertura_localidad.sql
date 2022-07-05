INSERT INTO smn_salud.smn_rel_cobertura_localidad
(
	smn_rel_cobertura_local_id,
	smn_coberturas_id,
	smn_localidad_id
)
VALUES
(
	${seq:nextval@smn_salud.seq_smn_rel_cobertura_localidad},
	${seq:currval@smn_salud.seq_smn_coberturas},
	${fld:smn_localidad_id}
)
