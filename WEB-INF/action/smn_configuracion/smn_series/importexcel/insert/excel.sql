INSERT INTO smn_salud.smn_series
(
	smn_serie_id,
	sri_codigo,
	sri_nombre,
	sri_estatus,
	sri_ultimo_numero,
	sri_reinicio,
	ctm_idioma,
	ctm_usuario_id,
	ctm_fecha_registro,
	ctm_hora
)
VALUES
(
	${seq:nextval@smn_salud.seq_smn_series},
	?,
	?,
	?,
	?,
	?,
	'${def:locale
}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
