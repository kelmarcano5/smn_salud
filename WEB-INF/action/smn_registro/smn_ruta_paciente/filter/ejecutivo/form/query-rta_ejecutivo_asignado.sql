select smn_base.smn_v_usuarios.smn_usuarios_id as id,smn_base.smn_v_usuarios.usr_nombres || ' - ' || smn_base.smn_v_usuarios.usr_apellidos as item 
from smn_base.smn_v_usuarios 
left outer join smn_base.smn_usuarios on smn_base.smn_usuarios.smn_auxiliar_rf = smn_base.smn_v_usuarios.smn_auxiliar_rf
left outer join smn_seguridad.s_user on smn_seguridad.s_user.user_id = smn_base.smn_usuarios.smn_user_rf
left outer join smn_seguridad.s_user_role on smn_seguridad.s_user_role.user_id = smn_seguridad.s_user.user_id 
left outer join smn_seguridad.s_role on smn_seguridad.s_role.role_id = smn_seguridad.s_user_role.role_id
left outer join smn_seguridad.s_application on smn_seguridad.s_application.app_id = smn_seguridad.s_role.app_id
where 
	smn_seguridad.s_application.app_id = 503
order by smn_base.smn_v_usuarios.usr_nombres