INSERT INTO smn_salud.smn_rel_patologia_servicios
(
	smn_rel_patologia_servicios_id,
	smn_patologia_id,
	smn_servicio_rf,
	rps_cantidad,
	rps_fecha_registro
)
VALUES
(
	${seq:nextval@smn_salud.seq_smn_rel_patologia_servicios},
	?,
	?,
	?,
	{d '${def:date}'}
)
