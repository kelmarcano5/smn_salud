
select
		smn_salud.smn_rel_usuarios_entidad.smn_rel_usuario_entidad_id,
	(select smn_base.smn_v_usuarios.usr_nombres || ' - ' || smn_base.smn_v_usuarios.usr_apellidos from  smn_base.smn_v_usuarios  where smn_base.smn_v_usuarios.smn_usuarios_id is not null  and smn_base.smn_v_usuarios.smn_usuarios_id=smn_salud.smn_rel_usuarios_entidad.smn_usuario_rf  order by smn_base.smn_v_usuarios.usr_nombres ) as smn_usuario_rf_combo,
	(select smn_base.smn_entidades.ent_codigo || ' - ' || smn_base.smn_entidades.ent_descripcion_corta from  smn_base.smn_entidades  where smn_base.smn_entidades.smn_entidades_id is not null  and smn_base.smn_entidades.smn_entidades_id=smn_salud.smn_rel_usuarios_entidad.smn_entidades_rf  order by smn_base.smn_entidades.ent_descripcion_corta ) as smn_entidades_rf_combo,
	(select smn_base.smn_sucursales.suc_codigo || ' - ' || smn_base.smn_sucursales.suc_nombre from  smn_base.smn_sucursales  where smn_base.smn_sucursales.smn_sucursales_id is not null  and smn_base.smn_sucursales.smn_sucursales_id=smn_salud.smn_rel_usuarios_entidad.smn_sucursales_rf  order by smn_base.smn_sucursales.suc_nombre ) as smn_sucursales_rf_combo,
	(select smn_base.smn_areas_servicios.ase_codigo || ' - ' || smn_base.smn_areas_servicios.ase_descripcion from  smn_base.smn_areas_servicios  where smn_base.smn_areas_servicios.smn_areas_servicios_id is not null  and smn_base.smn_areas_servicios.smn_areas_servicios_id=smn_salud.smn_rel_usuarios_entidad.smn_area_servicio_rf  order by smn_base.smn_areas_servicios.ase_descripcion ) as smn_area_servicio_rf_combo,
	(select smn_base.smn_unidades_servicios.uns_codigo || ' - ' || smn_base.smn_unidades_servicios.uns_descripcion from  smn_base.smn_unidades_servicios  where smn_base.smn_unidades_servicios.smn_unidades_servicios_id is not null  and smn_base.smn_unidades_servicios.smn_unidades_servicios_id=smn_salud.smn_rel_usuarios_entidad.smn_unidad_servicio_rf  order by smn_base.smn_unidades_servicios.uns_descripcion ) as smn_unidad_servicio_rf_combo
	
	
from
	smn_salud.smn_rel_usuarios_entidad

where
	smn_rel_usuario_entidad_id = ${fld:id}
