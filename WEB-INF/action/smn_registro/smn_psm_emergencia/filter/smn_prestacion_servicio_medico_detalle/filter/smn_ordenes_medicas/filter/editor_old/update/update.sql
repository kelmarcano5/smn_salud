UPDATE smn_salud.smn_ordenes_medicas SET
	smn_ingreso_id=${fld:smn_ingreso_id},
	omd_numero_orden=${fld:omd_numero_orden},
	omd_descripcion=${fld:omd_descripcion},
	smn_prestador_servicio_rf=${fld:smn_prestador_servicio_rf},
	omd_clase_auxiliar=${fld:omd_clase_auxiliar},
	omd_auxiliar=${fld:omd_auxiliar},
	omd_num_doc_oficial=${fld:omd_num_doc_oficial},
	omd_tipo_orden=${fld:omd_tipo_orden},
	omd_indicaciones=${fld:omd_indicaciones},
	omd_idioma='${def:locale}',
	omd_usuario='${def:user}',
	omd_fecha_registro={d '${def:date}'},
	omd_hora='${def:time}',
	omd_estatus=${fld:omd_estatus}

WHERE
	smn_ordenes_medicas_id=${fld:id}

