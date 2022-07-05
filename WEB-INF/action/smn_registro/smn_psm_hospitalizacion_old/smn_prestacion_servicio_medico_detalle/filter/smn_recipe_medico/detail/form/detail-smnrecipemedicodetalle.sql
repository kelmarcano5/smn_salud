select
select
select
	case
	when smn_salud.smn_recipe_medico_detalle.rmd_tiempo_frecuencia='AN' then '${lbl:b_year}'
	when smn_salud.smn_recipe_medico_detalle.rmd_tiempo_frecuencia='ME' then '${lbl:b_months}'
	when smn_salud.smn_recipe_medico_detalle.rmd_tiempo_frecuencia='SE' then '${lbl:b_week}'
	when smn_salud.smn_recipe_medico_detalle.rmd_tiempo_frecuencia='DI' then '${lbl:b_days}'
	when smn_salud.smn_recipe_medico_detalle.rmd_tiempo_frecuencia='HO' then '${lbl:b_hours}'
	when smn_salud.smn_recipe_medico_detalle.rmd_tiempo_frecuencia='VE' then '${lbl:every_time}'
	when smn_salud.smn_recipe_medico_detalle.rmd_tiempo_frecuencia='CD' then '${lbl:b_with_pain}'
	end as rmd_tiempo_frecuencia,
	smn_salud.smn_recipe_medico_detalle.*
from
	smn_salud.smn_recipe_medico_detalle,
	smn_salud.smn_recipe_medico
where
		smn_salud.smn_recipe_medico_detalle.smn_recipe_medico_id=smn_salud.smn_recipe_medico.smn_recipe_medico_id and
		smn_salud.smn_recipe_medico.smn_recipe_medico_id=${fld:id}
