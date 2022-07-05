INSERT INTO smn_salud.smn_coberturas_servicios
(
	smn_coberturas_servicios_id,
	smn_coberturas_id,
	smn_unidades_servicios_id
)
VALUES
(
	${seq:nextval@smn_salud.seq_smn_coberturas_servicios},
	${seq:currval@smn_salud.seq_smn_coberturas},
	${fld:smn_unidades_servicios_id}
)
