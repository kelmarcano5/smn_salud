-- select smn_base.smn_auxiliar_persona_natural.smn_auxiliar_persona_natural_id as id, 
-- 		smn_base.smn_auxiliar_persona_natural.ant_num_doc_oficial || ' - ' || smn_base.smn_auxiliar_persona_natural.ant_nombres || ' - ' || smn_base.smn_auxiliar_persona_natural.ant_apellidos as item 
-- from smn_base.smn_auxiliar_persona_natural 
-- 	left join smn_base.smn_usuarios on smn_base.smn_usuarios.smn_auxiliar_rf = smn_base.smn_auxiliar_persona_natural.smn_auxiliar_persona_natural_id
-- 	left join smn_seguridad.s_user on smn_seguridad.s_user.user_id =  smn_base.smn_usuarios.smn_user_rf
-- 	left join smn_base.smn_auxiliar_clase on smn_base.smn_auxiliar_clase.smn_auxiliar_id = smn_base.smn_usuarios.smn_auxiliar_rf
-- where 
-- 	smn_base.smn_auxiliar_clase.smn_clase_auxiliar_id = (select smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id from smn_base.smn_clase_auxiliar where smn_base.smn_clase_auxiliar.cla_codigo='PA')  
-- 	and smn_base.smn_auxiliar_persona_natural.ant_nombres is not null and smn_seguridad.s_user.userlogin='${def:user}'
-- order by smn_base.smn_auxiliar_persona_natural.ant_num_doc_oficial asc

select smn_base.smn_auxiliar.smn_auxiliar_id as id, 
		smn_base.smn_auxiliar.aux_nombres || ' - ' || smn_base.smn_auxiliar.aux_apellidos as item 
from smn_base.smn_auxiliar
	left join smn_base.smn_usuarios on smn_base.smn_usuarios.smn_auxiliar_rf = smn_base.smn_auxiliar.smn_auxiliar_id
	left join smn_seguridad.s_user on smn_seguridad.s_user.user_id =  smn_base.smn_usuarios.smn_user_rf
	left join smn_base.smn_auxiliar_clase on smn_base.smn_auxiliar_clase.smn_auxiliar_id = smn_base.smn_usuarios.smn_auxiliar_rf
where 
	smn_seguridad.s_user.userlogin='admin' 
order by smn_base.smn_auxiliar.aux_num_doc_oficial asc limit 1