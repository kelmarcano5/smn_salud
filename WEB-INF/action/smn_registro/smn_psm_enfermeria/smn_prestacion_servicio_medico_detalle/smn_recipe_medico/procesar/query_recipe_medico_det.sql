SELECT
     ${fld:smn_prestacion_servicio_medico_cabecera_id} as smn_prestacion_servicio_medico_cabecera_id, 
     ${fld:smn_ingreso_id}  as smn_ingreso_id, 
     ${fld:smn_documento_id} as smn_documento_id, 
     ${fld:smn_recipe_medico_id} as smn_recipe_medico_id, 
     case when ${fld:smn_prestador_servicio_rf} is null then 0 else ${fld:smn_prestador_servicio_rf} end as smn_prestador_servicio_rf,
    smn_salud.smn_recipe_medico_detalle.* ,
    smn_base.smn_componentes.smn_componentes_id
FROM
   smn_salud.smn_recipe_medico
        INNER JOIN smn_salud.smn_recipe_medico_detalle ON smn_salud.smn_recipe_medico.smn_recipe_medico_id = smn_salud.smn_recipe_medico_detalle.smn_recipe_medico_id
        INNER JOIN smn_base.smn_item ON smn_salud.smn_recipe_medico_detalle.smn_item_rf = smn_base.smn_item.smn_item_id
        INNER JOIN smn_base.smn_componentes ON smn_base.smn_item.smn_nivel_estructura_id = smn_base.smn_componentes.smn_item_rf
    INNER JOIN smn_salud.smn_ingresos ON smn_salud.smn_ingresos.smn_ingresos_id = smn_salud.smn_recipe_medico.smn_ingreso_id
WHERE
    smn_salud.smn_recipe_medico_detalle.smn_recipe_medico_id = ${fld:smn_recipe_medico_id} 
    AND smn_salud.smn_recipe_medico.smn_ingreso_id = ${fld:smn_ingreso_id};