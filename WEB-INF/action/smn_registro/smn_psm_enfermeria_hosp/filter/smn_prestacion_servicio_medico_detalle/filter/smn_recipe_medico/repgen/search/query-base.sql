select
	smn_base.smn_prestadores_servicios.prs_descripcion,
		smn_salud.smn_recipe_medico.smn_recipe_medico_id,
	${field}
from
	smn_base.smn_prestadores_servicios,
	smn_salud.smn_recipe_medico
where
	smn_base.smn_prestadores_servicios.smn_prestadores_servicios_id = smn_salud.smn_recipe_medico.rec_ordenante_nombre and
		smn_salud.smn_recipe_medico.smn_recipe_medico_id is not null
	${filter}
	
	
