UPDATE smn_salud.smn_citas SET
	smn_estatus_citas_id=4,
	cts_fecha_registro={d '${def:date}'}
WHERE
	smn_citas_id=${fld:id}

