INSERT INTO smn_salud.smn_rel_documentos_servicios
(
	smn_rel_documentos_servicios_id,
	smn_documentos_id,
	smn_servicios_id,
	rdt_tipo_generacion,
	rdt_hora_generacion
)
VALUES
(
	${seq:nextval@smn_salud.seq_smn_rel_documentos_servicios},
	?,
	?,
	?,
	?
)
