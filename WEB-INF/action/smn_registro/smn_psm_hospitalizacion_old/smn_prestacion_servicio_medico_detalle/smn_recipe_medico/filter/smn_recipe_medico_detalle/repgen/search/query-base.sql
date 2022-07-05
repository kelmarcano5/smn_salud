select
		smn_salud.smn_recipe_medico_detalle.smn_recipe_medico_detalle_id,
	${field}
from
	smn_salud.smn_recipe_medico_detalle
where
		smn_salud.smn_recipe_medico_detalle.smn_recipe_medico_detalle_id is not null
	${filter}
	
	
