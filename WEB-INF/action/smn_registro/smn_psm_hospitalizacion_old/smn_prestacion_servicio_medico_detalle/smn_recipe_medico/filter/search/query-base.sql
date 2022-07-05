select
	smn_salud.smn_recipe_medico.smn_recipe_medico_id,
	case
	when smn_salud.smn_recipe_medico.rec_estatus='RE' then '${lbl:b_registrado}'
	when smn_salud.smn_recipe_medico.rec_estatus='AP' then '${lbl:b_aprobado}'
	when smn_salud.smn_recipe_medico.rec_estatus='RZ' then '${lbl:b_rechazado}'
	end as rec_estatus,
	smn_salud.smn_recipe_medico.rec_fecha,
	smn_base.smn_auxiliar.aux_descripcion as smn_auxiliar_rf,
	smn_salud.smn_patologia.pat_descripcion as smn_patologia_id,
  prestador.aux_descripcion	as smn_prestador_servicio_rf,
	farmaceuta.aux_descripcion as smn_farmaceuta_prestador_servicio_rf,
	smn_salud.smn_recipe_medico.rec_fecha_aprobacion,
	smn_salud.smn_recipe_medico.rec_fecha_registro
	
from
	smn_salud.smn_recipe_medico
	inner join smn_base.smn_prestadores_servicios on smn_base.smn_prestadores_servicios.smn_prestadores_servicios_id = smn_salud.smn_recipe_medico.smn_prestador_servicio_rf
	inner join smn_base.smn_auxiliar farmaceuta on farmaceuta.smn_auxiliar_id = smn_salud.smn_recipe_medico.smn_farmaceuta_prestador_servicio_rf
	inner join smn_base.smn_auxiliar prestador on prestador.smn_auxiliar_id = smn_base.smn_prestadores_servicios.prs_auxiliar
	inner join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_salud.smn_recipe_medico.smn_auxiliar_rf
	inner join smn_salud.smn_patologia on smn_salud.smn_patologia.smn_patologia_id = smn_salud.smn_recipe_medico.smn_patologia_id

where
	smn_recipe_medico_id is not null
	${filter}
order by
		smn_recipe_medico_id
