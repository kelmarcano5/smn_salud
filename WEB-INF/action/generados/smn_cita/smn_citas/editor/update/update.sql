UPDATE smn_salud.smn_citas SET
	cts_num_control=${fld:cts_num_control},
	cts_num_doc_oficial=${fld:cts_num_doc_oficial},
	smn_motivos_id=${fld:smn_motivos_id},
	cts_clase_auxiliar=${fld:cts_clase_auxiliar},
	cts_auxiliar=${fld:cts_auxiliar},
	smn_origen_id=${fld:smn_origen_id},
	cts_ordenante=${fld:cts_ordenante},
	cts_tipo_orden=${fld:cts_tipo_orden},
	cts_titular=${fld:cts_titular},
	smn_estatus_citas_id=${fld:smn_estatus_citas_id},
	smn_relacionados_id=${fld:smn_relacionados_id},
	smn_citas_mov_id=${fld:smn_citas_mov_id},
	cts_idioma='${def:locale}',
	cts_usuario='${def:user}',
	cts_fecha_registro={d '${def:date}'},
	cts_hora='${def:time}'

WHERE
	smn_citas_id=${fld:id}

