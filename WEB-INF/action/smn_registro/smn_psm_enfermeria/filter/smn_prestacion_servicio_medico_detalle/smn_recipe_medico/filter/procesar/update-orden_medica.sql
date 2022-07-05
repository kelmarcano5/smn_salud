UPDATE smn_salud.smn_recipe_medico SET
    rec_estatus='AP'

WHERE
    smn_recipe_medico_id=${fld:smn_recipe_medico_id} and smn_ingreso_id=${fld:smn_ingreso_id}

