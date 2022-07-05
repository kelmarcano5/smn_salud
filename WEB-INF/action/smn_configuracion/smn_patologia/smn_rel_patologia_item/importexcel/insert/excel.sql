INSERT INTO smn_salud.smn_rel_patologia_item
(
	smn_rel_patologia_item_id,
	smn_patologia_id,
	smn_item_rf,
	rps_cantidad,
	rps_fecha_registro
)
VALUES
(
	${seq:nextval@smn_salud.seq_smn_rel_patologia_item},
	?,
	?,
	?,
	{d '${def:date}'}
)
