INSERT INTO smn_salud.smn_citas_servicios
(
	smn_citas_servicios_id,
	smn_citas_id,
	smn_servicios_id
)
VALUES
(
	${seq:nextval@smn_salud.seq_smn_citas_servicios},
	${fld:id},
	${fld:smn_servicios_id}
)
