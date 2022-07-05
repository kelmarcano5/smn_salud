INSERT INTO smn_salud.smn_afiliados
(
	smn_afiliados_id,
	afi_num_control,
	afi_apellidos,
	afi_nombres,
	afi_sexo,
	afi_tipo_doc_oficial,
	afi_nro_doc_oficial,
	afi_idioma,
	afi_usuario,
	afi_fecha_registro,
	afi_hora
)
VALUES
(
	${seq:currval@smn_salud.seq_smn_afiliados},
	${fld:afi_num_control},
	${fld:afi_apellidos},
	${fld:afi_nombres},
	${fld:afi_sexo},
	${fld:afi_tipo_doc_oficial},
	${fld:afi_nro_doc_oficial},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
