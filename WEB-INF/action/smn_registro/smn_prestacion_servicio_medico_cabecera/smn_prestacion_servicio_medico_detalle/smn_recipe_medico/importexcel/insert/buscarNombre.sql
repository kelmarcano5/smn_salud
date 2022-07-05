select
		smn_salud.smn_recipe_medico.rec_ordenante_nombre_desc_ref
from
		smn_salud.smn_recipe_medico
where
		upper(smn_salud.smn_recipe_medico.rec_ordenante_nombre_desc_ref) = upper(${fld:rec_ordenante_nombre_desc_ref})
