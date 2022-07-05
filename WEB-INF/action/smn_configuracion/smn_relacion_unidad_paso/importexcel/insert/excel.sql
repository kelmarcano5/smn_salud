INSERT INTO smn_salud.smn_relacion_unidad_paso
(
	smn_rel_unidad_paso,
	smn_area_servicio_rf,
	smn_unidad_servicio_rf,
	smn_paso_rf,
	smn_serie_id,
	rup_secuencia ,
	rup_estatus,
	rup_vigencia,
	rup_idioma,
	rup_usuario_id,
	rup_fecha_registro,
	rup_hora
)
VALUES
(
	${seq:nextval@smn_salud.seq_smn_relacion_unidad_paso},
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
	'${def:time
}'
)
