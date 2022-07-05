select DISTINCT smn_base.smn_usuarios.smn_usuarios_id  as id, ejecutivo.aux_codigo ||''|| ejecutivo.aux_descripcion as item from smn_salud.smn_ruta_paciente
inner join smn_base.smn_usuarios on smn_base.smn_usuarios.smn_usuarios_id = smn_salud.smn_ruta_paciente.rta_ejecutivo_asignado
inner join smn_base.smn_auxiliar ejecutivo on ejecutivo.smn_auxiliar_id = smn_base.smn_usuarios.smn_auxiliar_rf
inner join smn_salud.smn_rol on smn_salud.smn_rol.smn_usuario_id = smn_base.smn_usuarios.smn_usuarios_id
where smn_salud.smn_rol.rol_tipo='SO' 