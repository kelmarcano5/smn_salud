select smn_base.smn_entidades.smn_entidades_id as id, smn_base.smn_entidades.ent_codigo || ' - ' ||  smn_base.smn_entidades.ent_descripcion_corta as item from smn_base.smn_entidades 
inner join smn_salud.smn_rol on smn_salud.smn_rol.smn_entidad_rf = smn_base.smn_entidades.smn_entidades_id
inner join smn_base.smn_usuarios on smn_base.smn_usuarios.smn_usuarios_id = smn_salud.smn_rol.smn_usuario_id
inner join smn_seguridad.s_user on smn_seguridad.s_user.user_id = smn_base.smn_usuarios.smn_user_rf
where 
	smn_seguridad.s_user.userlogin='${def:user}' 
order by smn_base.smn_entidades.ent_codigo asc LIMIT 1