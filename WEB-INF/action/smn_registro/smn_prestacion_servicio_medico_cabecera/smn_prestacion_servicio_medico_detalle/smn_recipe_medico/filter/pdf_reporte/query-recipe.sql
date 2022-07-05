SELECT
	case 
		when smn_inventario.smn_principio_activo.pac_descripcion is null then smn_salud.smn_marca_comercial.mac_descripcion else smn_inventario.smn_principio_activo.pac_descripcion
	end as smn_item_rf_combo,
	--smn_inventario.smn_principio_activo.pac_descripcion AS smn_item_rf_combo,
	smn_base.smn_unidad_medida.unm_codigo ||' - '|| smn_base.smn_unidad_medida.unm_descripcion AS smn_unidad_medida_rf_combo,
	smn_salud.smn_recipe_medico_detalle.rmd_dosis,
	smn_salud.smn_recipe_medico_detalle.rmd_frecuencia,
	CASE
		WHEN smn_salud.smn_recipe_medico_detalle.rmd_tiempo_frecuencia='DI' THEN '${lbl:b_days}'
		WHEN smn_salud.smn_recipe_medico_detalle.rmd_tiempo_frecuencia='HO' THEN '${lbl:b_hours}'
	END AS rmd_tiempo_frecuencia_combo,
	smn_salud.smn_recipe_medico_detalle.rmd_especificacion,
	smn_salud.smn_recipe_medico_detalle.rmd_dias_tratamiento,
	smn_salud.smn_recipe_medico_detalle.rmd_concentracion
FROM
	smn_salud.smn_recipe_medico_detalle
	left JOIN
	smn_inventario.smn_principio_activo ON smn_inventario.smn_principio_activo.smn_principio_activo_id =smn_salud.smn_recipe_medico_detalle.smn_principio_activo_rf
	left JOIN
	smn_base.smn_unidad_medida ON smn_base.smn_unidad_medida.smn_unidad_medida_id=smn_salud.smn_recipe_medico_detalle.smn_unidad_medida_rf
	left join smn_salud.smn_marca_comercial on smn_salud.smn_marca_comercial.smn_marca_comercial_id = smn_salud.smn_recipe_medico_detalle.smn_marca_comercial_id
WHERE
	smn_salud.smn_recipe_medico_detalle.smn_recipe_medico_id=${fld:id}