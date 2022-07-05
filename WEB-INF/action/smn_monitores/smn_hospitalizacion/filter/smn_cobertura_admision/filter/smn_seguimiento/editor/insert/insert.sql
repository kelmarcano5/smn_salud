INSERT INTO smn_salud.smn_seguimiento
(
	smn_seguimiento_id,
	smn_ingreso_id,
	seg_fecha,
	seg_hora_seg,
	seg_accion,
	seg_observacion,
	seg_estatus,
	seg_idioma,
	seg_usuario,
	seg_fecha_registro,
	seg_hora
)
VALUES
(
	${seq:currval@smn_salud.seq_smn_seguimiento},
	${fld:smn_ingreso_id},
	${fld:seg_fecha},
	${fld:seg_hora_seg},
	${fld:seg_accion},
	${fld:seg_observacion},
	${fld:seg_estatus},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
