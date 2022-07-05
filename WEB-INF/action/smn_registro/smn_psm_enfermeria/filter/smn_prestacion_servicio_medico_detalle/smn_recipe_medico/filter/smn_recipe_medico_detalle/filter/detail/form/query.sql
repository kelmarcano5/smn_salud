select
	smn_salud.smn_recipe_medico_detalle.smn_recipe_medico_id,
	case
	when smn_salud.smn_recipe_medico_detalle.rmd_tiempo_frecuencia='AN' then '${lbl:b_year}'
	when smn_salud.smn_recipe_medico_detalle.rmd_tiempo_frecuencia='ME' then '${lbl:b_months}'
	when smn_salud.smn_recipe_medico_detalle.rmd_tiempo_frecuencia='SE' then '${lbl:b_week}'
	when smn_salud.smn_recipe_medico_detalle.rmd_tiempo_frecuencia='DI' then '${lbl:b_days}'
	when smn_salud.smn_recipe_medico_detalle.rmd_tiempo_frecuencia='HO' then '${lbl:b_hours}'
	when smn_salud.smn_recipe_medico_detalle.rmd_tiempo_frecuencia='VE' then '${lbl:every_time}'
	when smn_salud.smn_recipe_medico_detalle.rmd_tiempo_frecuencia='CD' then '${lbl:b_with_pain}'
	end as rmd_tiempo_frecuencia1,
	smn_base.smn_item.itm_nombre as  smn_item_rf,
	smn_inventario.smn_presentacion.pre_descripcion as smn_presentacion_rf,
	smn_inventario.smn_principio_activo.pac_descripcion_completa as smn_principio_activo_rf,
	smn_salud.smn_recipe_medico_detalle.rmd_dias_tratamiento,
	smn_salud.smn_recipe_medico_detalle.rmd_dosis,
	smn_salud.smn_recipe_medico_detalle.rmd_dosis_total,
	smn_salud.smn_recipe_medico_detalle.rmd_especificacion,
	smn_salud.smn_recipe_medico_detalle.rmd_frecuencia,
	smn_base.smn_unidad_medida.unm_descripcion as smn_unidad_medida_rf,
	smn_salud.smn_recipe_medico_detalle.rmd_observacion,
	smn_salud.smn_recipe_medico_detalle.rmd_fecha_registro
from
	smn_salud.smn_recipe_medico_detalle
	inner join smn_base.smn_item on smn_base.smn_item.smn_item_id = smn_salud.smn_recipe_medico_detalle.smn_item_rf
	inner join smn_inventario.smn_presentacion on smn_inventario.smn_presentacion.smn_presentacion_id = smn_salud.smn_recipe_medico_detalle.smn_presentacion_rf
	inner join smn_inventario.smn_principio_activo on smn_inventario.smn_principio_activo.smn_principio_activo_id = smn_salud.smn_recipe_medico_detalle.smn_principio_activo_rf
	inner join smn_base.smn_unidad_medida on smn_base.smn_unidad_medida.smn_unidad_medida_id = smn_salud.smn_recipe_medico_detalle.smn_unidad_medida_rf
where
	smn_recipe_medico_detalle_id = ${fld:id}
