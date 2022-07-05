INSERT INTO smn_salud.smn_contratante
(
	smn_contratante_id,
	smn_documento_id,
	cnt_numero_control,
	smn_clase_auxiliar_rf,
	smn_auxiliar_rf,
	smn_plan_id,
	cnt_fecha_de_inicio,
	cnt_cantidad_citas,
	cnt_idioma,
	cnt_usuario_id,
	cnt_fecha_registro,
	cnt_hora
)
VALUES
(
	${seq:nextval@smn_salud.seq_smn_contratante},
	?,
	?,
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