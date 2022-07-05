UPDATE smn_salud.smn_relacion_unidad_paso SET
	smn_area_servicio_rf=${fld:smn_area_servicio_rf},
	smn_unidad_servicio_rf=${fld:smn_unidad_servicio_rf},
	smn_paso_rf=${fld:smn_paso_rf},
	smn_serie_id=${fld:smn_serie_id},
	rup_secuencia=${fld:rup_secuencia},
	rup_unidad_administrativa=${fld:rup_unidad_administrativa},
	rup_estatus=${fld:rup_estatus},
	rup_vigencia=${fld:rup_vigencia},
	rup_idioma='${def:locale}',
	rup_usuario_id='${def:user}',
	rup_fecha_registro={d '${def:date}'},
	rup_hora='${def:time}'

WHERE
	smn_rel_unidad_paso=${fld:id}

