INSERT INTO smn_salud.smn_rel_orden_medica_servicios
(
	smn_rel_orden_medica_servicios_id,
	smn_ordenes_medicas_id,
	smn_servicios_rf
)
VALUES
(
	${seq:nextval@smn_salud.seq_smn_rel_orden_medica_servicios},
	${fld:id},
	${fld:smn_servicios_id}
)
