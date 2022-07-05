UPDATE smn_salud.smn_recipe_medico_detalle SET
	smn_recipe_medico_id=${fld:smn_recipe_medico_id},
	smn_principio_activo_rf=${fld:smn_principio_activo_rf},
	smn_item_rf=${fld:smn_item_rf},
	smn_presentacion_rf=${fld:smn_presentacion_rf},
	smn_unidad_medida_rf=${fld:smn_unidad_medida_rf},
	rmd_dosis=${fld:rmd_dosis},
	rmd_frecuencia=${fld:rmd_frecuencia},
	rmd_tiempo_frecuencia=${fld:rmd_tiempo_frecuencia},
	rmd_especificacion=${fld:rmd_especificacion},
	rmd_dias_tratamiento=${fld:rmd_dias_tratamiento},
	rmd_dosis_total=${fld:rmd_dosis_total},
	rmd_observacion=${fld:rmd_observacion},
	rmd_idioma='${def:locale}',
	rmd_usuario='${def:user}',
	rmd_fecha_registro={d '${def:date}'},
	rmd_hora='${def:time}',
	rmd_tiempo_frecuencia_2=${fld:rmd_tiempo_frecuencia_2},
	smn_marca_comercial=${fld:smn_marca_comercial}

WHERE
	smn_recipe_medico_detalle_id=${fld:id}

