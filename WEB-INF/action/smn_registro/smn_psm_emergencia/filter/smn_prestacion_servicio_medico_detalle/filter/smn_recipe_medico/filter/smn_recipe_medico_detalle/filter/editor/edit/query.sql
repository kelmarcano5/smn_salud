select	
	smn_salud.smn_recipe_medico.smn_recipe_medico_id, 
	smn_salud.smn_recipe_medico.rec_estatus as rec_estatus_pl0,
	smn_salud.smn_recipe_medico_detalle.*
from
	smn_salud.smn_recipe_medico,
	smn_salud.smn_recipe_medico_detalle 
where
	smn_salud.smn_recipe_medico.smn_recipe_medico_id=smn_salud.smn_recipe_medico_detalle.smn_recipe_medico_id and
	smn_recipe_medico_detalle_id = ${fld:id} 
	


