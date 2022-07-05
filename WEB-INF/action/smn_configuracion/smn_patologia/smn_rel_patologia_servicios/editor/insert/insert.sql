INSERT INTO smn_salud.smn_rel_patologia_servicios
(
	smn_rel_patologia_servicios_id,
	smn_patologia_id,
	smn_servicio_rf,
	rps_cantidad,
	rps_idioma,
	rps_usuario_id,
	rps_fecha_registro,
	rps_hora
)
VALUES
(
	${seq:currval@smn_salud.seq_smn_rel_patologia_servicios},
	${fld:smn_patologia_id},
	${fld:smn_servicio_rf},
	${fld:rps_cantidad},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
