UPDATE smn_salud.smn_citas SET
	smn_documento_id=${fld:smn_documento_id},
	cts_num_control=${fld:cts_num_control},
	smn_entidades_rf=${fld:smn_entidades_rf},
	smn_sucursales_rf=${fld:smn_sucursales_rf},
	cts_numero_ticket=${fld:cts_numero_ticket},
	smn_origen_id=${fld:smn_origen_id},
	cts_clase_auxiliar=${fld:cts_clase_auxiliar},
	cts_auxiliar=${fld:cts_auxiliar},
	smn_condicion_financiera_rf=${fld:smn_condicion_financiera_rf},	
	smn_contratante_id=${fld:smn_contratante_id},
	smn_observaciones_id=${fld:smn_observaciones_id},
	smn_estatus_citas_id=${fld:smn_estatus_citas_id},
	cts_idioma='${def:locale}',
	cts_usuario='${def:user}',
	cts_fecha_registro={d '${def:date}'},
	cts_hora='${def:time}'
WHERE
	smn_citas_id=${fld:id}

