select
		smn_salud.smn_recipe_medico.rec_ordenante_nombre
from
		smn_salud.smn_recipe_medico
where
		upper(smn_salud.smn_recipe_medico.rec_ordenante_nombre) = upper(${fld:rec_ordenante_nombre})
