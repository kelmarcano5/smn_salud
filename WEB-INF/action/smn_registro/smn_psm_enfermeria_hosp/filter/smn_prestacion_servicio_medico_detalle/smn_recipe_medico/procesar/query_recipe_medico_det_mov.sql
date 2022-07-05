SELECT
     ${fld:smn_ingreso_id} as smn_ingreso_id, 
     ${fld:smn_documento_id} as smn_documento_id, 
     ${fld:smn_recipe_medico_id} as smn_recipe_medico_id, 
     ${fld:smn_prestador_servicio_rf} as smn_prestador_servicio_rf, 
     ${fld:rmd_dosis} as rmd_dosis,
    smn_salud.smn_recipe_medico_detalle.* 
FROM
    smn_salud.smn_recipe_medico
    INNER JOIN smn_salud.smn_ingresos ON smn_salud.smn_ingresos.smn_ingresos_id = smn_salud.smn_recipe_medico.smn_ingreso_id
    INNER JOIN smn_salud.smn_recipe_medico_detalle ON smn_salud.smn_recipe_medico_detalle.smn_recipe_medico_id = smn_salud.smn_recipe_medico.smn_recipe_medico_id 
WHERE
    smn_salud.smn_recipe_medico_detalle.smn_recipe_medico_id = ${fld:smn_recipe_medico_id} 
    AND smn_salud.smn_recipe_medico.smn_ingreso_id = ${fld:smn_ingreso_id};