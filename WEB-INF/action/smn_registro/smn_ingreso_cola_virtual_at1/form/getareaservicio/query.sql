SELECT DISTINCT
	smn_base.smn_areas_servicios.smn_areas_servicios_id as id,
	smn_base.smn_areas_servicios.ase_codigo||'-'||smn_base.smn_areas_servicios.ase_descripcion as item 
from smn_base.smn_areas_servicios
inner join smn_salud.smn_rol on smn_salud.smn_rol.smn_area_servicio_rf = smn_base.smn_areas_servicios.smn_areas_servicios_id
inner join smn_base.smn_usuarios on smn_base.smn_usuarios.smn_usuarios_id = smn_salud.smn_rol.smn_usuario_id
inner join smn_seguridad.s_user on smn_seguridad.s_user.user_id = smn_base.smn_usuarios.smn_user_rf
where smn_base.smn_areas_servicios.ase_empresa=${fld:id} and smn_seguridad.s_user.userlogin='${def:user}'
