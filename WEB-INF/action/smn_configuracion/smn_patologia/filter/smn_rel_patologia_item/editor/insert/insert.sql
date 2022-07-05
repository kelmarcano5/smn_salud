INSERT INTO smn_salud.smn_rel_patologia_item
(
	smn_rel_patologia_item_id,
	smn_patologia_id,
	smn_item_rf,
	rps_cantidad,
	rps_idioma,
	rps_usuario_id,
	rps_fecha_registro,
	rps_hora
)
VALUES
(
	${seq:currval@smn_salud.seq_smn_rel_patologia_item},
	${fld:smn_patologia_id},
	${fld:smn_item_rf},
	${fld:rps_cantidad},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
