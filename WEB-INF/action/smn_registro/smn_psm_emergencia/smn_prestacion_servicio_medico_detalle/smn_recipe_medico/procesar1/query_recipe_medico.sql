SELECT
	smn_salud.smn_recipe_medico.smn_recipe_medico_id,
	smn_salud.smn_recipe_medico.smn_prestador_servicio_rf,
	smn_salud.smn_recipe_medico.smn_ingreso_id,
	smn_salud.smn_ingresos.smn_documento_id 
FROM
	smn_salud.smn_recipe_medico
	INNER JOIN smn_salud.smn_ingresos ON smn_salud.smn_ingresos.smn_ingresos_id = smn_salud.smn_recipe_medico.smn_ingreso_id 
WHERE
	smn_salud.smn_recipe_medico.smn_recipe_medico_id = ${fld:smn_recipe_medico_id} 
	AND smn_salud.smn_recipe_medico.smn_ingreso_id = ${fld:smn_ingreso_id};