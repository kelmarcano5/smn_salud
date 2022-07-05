INSERT INTO smn_salud.smn_rel_planes_coberturas
(
	smn_rel_planes_coberturas_id,
	smn_planes_id,
	smn_coberturas_id
)
VALUES
(
	${seq:nextval@smn_salud.seq_smn_rel_planes_coberturas},
	${seq:currval@smn_salud.seq_smn_planes},
	${fld:smn_coberturas_id}
)
