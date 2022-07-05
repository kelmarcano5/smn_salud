UPDATE smn_salud.smn_citas SET
	smn_documento_id=${fld:smn_documento_id},
	cts_clase_auxiliar=${fld:cts_clase_auxiliar},
	cts_auxiliar=${fld:cts_auxiliar},
	smn_condicion_financiera_rf=${fld:smn_condicion_financiera_rf},	
	smn_contratante_id=${fld:smn_contratante_id},
	smn_observaciones_id=${fld:smn_observaciones_id},
	cts_idioma='${def:locale}',
	cts_usuario='${def:user}',
	cts_fecha_registro={d '${def:date}'},
	cts_hora='${def:time}'
WHERE
	smn_citas_id=${fld:id}

