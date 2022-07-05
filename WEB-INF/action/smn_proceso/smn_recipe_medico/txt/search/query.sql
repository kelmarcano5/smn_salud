select
	smn_base.smn_prestadores_servicios.prs_descripcion,
		smn_salud.smn_recipe_medico.smn_recipe_medico_id,
select
		smn_salud.smn_recipe_medico.smn_recipe_medico_id,
select
		smn_salud.smn_recipe_medico.smn_recipe_medico_id,
select
		smn_salud.smn_recipe_medico.smn_recipe_medico_id,
select
		smn_salud.smn_recipe_medico.smn_recipe_medico_id,
	case
	when smn_salud.smn_recipe_medico.rec_estatus='RE' then '${lbl:b_registrado}'
	when smn_salud.smn_recipe_medico.rec_estatus='AP' then '${lbl:b_aprobado}'
	when smn_salud.smn_recipe_medico.rec_estatus='RZ' then '${lbl:b_rechazado}'
	end as rec_estatus,
	smn_salud.smn_recipe_medico.rec_fecha,
	smn_salud.smn_recipe_medico.smn_auxiliar_rf,
	smn_salud.smn_recipe_medico.smn_patologia_id,
	smn_salud.smn_recipe_medico.smn_prestador_servicio_rf,
	smn_salud.smn_recipe_medico.smn_farmaceuta_prestador_servicio_rf,
	smn_salud.smn_recipe_medico.rec_fecha_aprobacion,
	smn_salud.smn_recipe_medico.rec_estatus,
	smn_salud.smn_recipe_medico.rec_fecha_registro
	
from

	smn_base.smn_prestadores_servicios,
	smn_salud.smn_recipe_medico
where
	smn_base.smn_prestadores_servicios.smn_prestadores_servicios_id = smn_salud.smn_recipe_medico.rec_ordenante_nombre
