select smn_base.smn_usuarios.smn_usuarios_id as id, smn_base.smn_auxiliar.aux_descripcion as item from smn_base.smn_usuarios
inner join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_base.smn_usuarios.smn_auxiliar_rf
inner join smn_salud.smn_rol on smn_salud.smn_rol.smn_rol_id = smn_base.smn_usuarios.smn_usuarios_id
where
smn_salud.smn_rol.rol_tipo='SO'