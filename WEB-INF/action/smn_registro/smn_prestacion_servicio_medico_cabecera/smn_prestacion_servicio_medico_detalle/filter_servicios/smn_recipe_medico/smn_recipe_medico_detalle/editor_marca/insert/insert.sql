INSERT INTO smn_salud.smn_marca_comercial
(
	smn_marca_comercial_id,
	mac_codigo,
	mac_descripcion,
	mac_idioma,
	mac_usuario_id,
	mac_fecha_registro,
	mac_hora
)
VALUES
(
	${seq:currval@smn_salud.seq_smn_marca_comercial},
	${fld:mac_codigo},
	${fld:mac_descripcion},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
