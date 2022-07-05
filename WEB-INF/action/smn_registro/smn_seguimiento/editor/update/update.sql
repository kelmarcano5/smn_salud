UPDATE smn_salud.smn_seguimiento SET
	smn_ingreso_id=${fld:smn_ingreso_id},
	seg_fecha=${fld:seg_fecha},
	seg_hora_seg=${fld:seg_hora_seg},
	seg_accion=${fld:seg_accion},
	seg_observacion=${fld:seg_observacion},
	seg_estatus=${fld:seg_estatus},
	seg_idioma='${def:locale}',
	seg_usuario='${def:user}',
	seg_fecha_registro={d '${def:date}'},
	seg_hora='${def:time}'

WHERE
	smn_seguimiento_id=${fld:id}

