INSERT INTO smn_salud.smn_naturaleza_servicio
(
	smn_naturaleza_servicio_id,
	smn_tipo_servicio_rf,
	nts_naturaleza,
	nts_idioma,
	nts_usuario,
	nts_fecha_registro,
	nts_hora
)
VALUES
(
	${seq:currval@smn_salud.seq_smn_naturaleza_servicio},
	${fld:smn_tipo_servicio_rf},
	${fld:nts_naturaleza},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
