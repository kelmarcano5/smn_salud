select
	smn_salud.smn_plan_quirurgico.smn_plan_quirurgico_id,
	case
	when smn_salud.smn_plan_quirurgico.plq_estatus='AC' then '${lbl:b_active}'
	when smn_salud.smn_plan_quirurgico.plq_estatus='IIN' then '${lbl:b_inactive}'
	end as plq_estatus,
	smn_base.smn_entidades.ent_descripcion_corta as smn_entidad_rf,
	smn_base.smn_sucursales.suc_nombre as smn_sucursal_rf,
	smn_salud.smn_habitaciones.hab_descripcion as smn_habitaciones_id,
	contra.aux_descripcion as smn_contratante_id,
	smn_base.smn_clase_auxiliar.cla_nombre as smn_clase_auxiliar_rf,
	smn_base.smn_auxiliar.aux_descripcion as smn_auxiliar_rf,
	smn_salud.smn_patologia.pat_descripcion as smn_patologia_rf,
	smn_salud.smn_plan_quirurgico.plq_fecha_cirugia,
	smn_salud.smn_plan_quirurgico.plq_hora_inicial,
	smn_salud.smn_plan_quirurgico.plq_hora_final,
	smn_salud.smn_plan_quirurgico.plq_cantidad_horas,
	smn_salud.smn_plan_quirurgico.plq_fecha_registro
	
from
	smn_salud.smn_plan_quirurgico
	inner join smn_base.smn_entidades on smn_base.smn_entidades.smn_entidades_id = 	smn_salud.smn_plan_quirurgico.smn_entidad_rf
	left join smn_base.smn_sucursales on smn_base.smn_sucursales.smn_sucursales_id = 	smn_salud.smn_plan_quirurgico.smn_sucursal_rf
	inner join smn_salud.smn_habitaciones on smn_salud.smn_habitaciones.smn_habitaciones_id = smn_salud.smn_plan_quirurgico.smn_habitaciones_id
	inner join smn_base.smn_clase_auxiliar on smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id = smn_salud.smn_plan_quirurgico.smn_clase_auxiliar_rf
	inner join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_salud.smn_plan_quirurgico.smn_auxiliar_rf
	inner join smn_salud.smn_patologia on smn_salud.smn_patologia.smn_patologia_id = smn_salud.smn_plan_quirurgico.smn_patologia_rf
	left join smn_salud.smn_contratante on smn_salud.smn_contratante.smn_contratante_id = smn_salud.smn_plan_quirurgico.smn_contratante_id
	left join smn_base.smn_auxiliar contra on contra.smn_auxiliar_id = smn_salud.smn_contratante.smn_auxiliar_rf

WHERE 
	smn_salud.smn_habitaciones.hab_naturaleza='QX'