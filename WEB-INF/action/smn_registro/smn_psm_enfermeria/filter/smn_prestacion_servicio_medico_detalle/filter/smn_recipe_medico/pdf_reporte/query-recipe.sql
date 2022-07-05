SELECT
	smn_base.smn_item.itm_codigo ||' - '|| smn_base.smn_item.itm_nombre AS smn_item_rf_combo,
	smn_base.smn_unidad_medida.unm_codigo ||' - '|| smn_base.smn_unidad_medida.unm_descripcion AS smn_unidad_medida_rf_combo,
	smn_salud.smn_recipe_medico_detalle.rmd_dosis,
	smn_salud.smn_recipe_medico_detalle.rmd_frecuencia,
	CASE
		WHEN smn_salud.smn_recipe_medico_detalle.rmd_tiempo_frecuencia='DI' THEN '${lbl:b_days}'
		WHEN smn_salud.smn_recipe_medico_detalle.rmd_tiempo_frecuencia='HO' THEN '${lbl:b_hours}'
	END AS rmd_tiempo_frecuencia_combo,
	smn_salud.smn_recipe_medico_detalle.rmd_especificacion,
	smn_salud.smn_recipe_medico_detalle.rmd_dias_tratamiento
FROM
	smn_salud.smn_recipe_medico_detalle
	INNER JOIN
	smn_base.smn_item ON smn_base.smn_item.smn_item_id=smn_salud.smn_recipe_medico_detalle.smn_item_rf
	INNER JOIN
	smn_base.smn_unidad_medida ON smn_base.smn_unidad_medida.smn_unidad_medida_id=smn_salud.smn_recipe_medico_detalle.smn_unidad_medida_rf
WHERE
	smn_salud.smn_recipe_medico_detalle.smn_recipe_medico_id=${fld:id}