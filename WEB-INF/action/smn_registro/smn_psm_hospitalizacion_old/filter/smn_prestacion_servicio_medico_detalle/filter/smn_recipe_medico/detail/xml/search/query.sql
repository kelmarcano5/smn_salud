select
	(select smn_base.smn_v_auxiliar.smn_codigo || ' - ' ||  smn_base.smn_v_auxiliar.smn_item from  smn_base.smn_v_auxiliar  where smn_base.smn_v_auxiliar.smn_v_auxiliar_id is not null  and smn_base.smn_v_auxiliar.smn_v_auxiliar_id=smn_salud.smn_recipe_medico.smn_auxiliar_rf  order by smn_base.smn_v_auxiliar.smn_item ) as smn_auxiliar_rf,
	(select smn_salud.smn_patologia.pat_descripcion from  smn_salud.smn_patologia  where smn_salud.smn_patologia.smn_patologia_id is not null  and smn_salud.smn_patologia.smn_patologia_id=smn_salud.smn_recipe_medico.smn_patologia_id  order by smn_salud.smn_patologia.pat_descripcion ) as smn_patologia_id,
	(select smn_base.smn_prestadores_servicios.prs_codigo || ' - ' || smn_base.smn_prestadores_servicios.prs_codigo  || '  ' || smn_base.smn_prestadores_servicios.prs_descripcion from  smn_base.smn_prestadores_servicios  where smn_base.smn_prestadores_servicios.smn_prestadores_servicios_id is not null  and smn_base.smn_prestadores_servicios.smn_prestadores_servicios_id=smn_salud.smn_recipe_medico.smn_prestador_servicio_rf  order by smn_base.smn_prestadores_servicios.prs_codigo ) as smn_prestador_servicio_rf,
	(select smn_base.smn_prestadores_servicios.prs_codigo || ' - ' || smn_base.smn_prestadores_servicios.prs_codigo || ' ' || smn_base.smn_prestadores_servicios.prs_descripcion from  smn_base.smn_prestadores_servicios  where smn_base.smn_prestadores_servicios.smn_prestadores_servicios_id is not null  and smn_base.smn_prestadores_servicios.smn_prestadores_servicios_id=smn_salud.smn_recipe_medico.rec_ordenante_nombre  order by smn_base.smn_prestadores_servicios.prs_codigo ) as rec_ordenante_nombre,
	(select smn_base.smn_auxiliar.aux_descripcion from  smn_salud.smn_contratante left join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_salud.smn_contratante.smn_auxiliar_rf where smn_salud.smn_contratante.smn_contratante_id is not null  and smn_salud.smn_contratante.smn_contratante_id=smn_salud.smn_recipe_medico.smn_contratante_id) as smn_contratante_id,
	(select smn_base.smn_prestadores_servicios.prs_codigo || ' - ' || smn_base.smn_prestadores_servicios.prs_codigo  || '  ' || smn_base.smn_prestadores_servicios.prs_descripcion from  smn_base.smn_prestadores_servicios  where smn_base.smn_prestadores_servicios.smn_prestadores_servicios_id is not null  and smn_base.smn_prestadores_servicios.smn_prestadores_servicios_id=smn_salud.smn_recipe_medico.smn_farmaceuta_prestador_servicio_rf  order by smn_base.smn_prestadores_servicios.prs_codigo ) as smn_farmaceuta_prestador_servicio_rf,
	case
		when smn_salud.smn_recipe_medico.rec_estatus='RE' then '${lbl:b_registrado}'
		when smn_salud.smn_recipe_medico.rec_estatus='AP' then '${lbl:b_aprobado}'
		when smn_salud.smn_recipe_medico.rec_estatus='RZ' then '${lbl:b_rechazado}'
	end as rec_estatus,
	smn_salud.smn_recipe_medico.*
from 
	smn_salud.smn_recipe_medico
where
	smn_recipe_medico_id = ${fld:id}
