select
	(select smn_base.smn_v_usuarios.usr_nombres || ' - ' || smn_base.smn_v_usuarios.usr_apellidos from smn_base.smn_v_usuarios where smn_base.smn_v_usuarios.smn_usuarios_id is not null  and smn_base.smn_v_usuarios.smn_usuarios_id = smn_salud.smn_planificacion_de_turno.smn_usuario_id  order by smn_base.smn_v_usuarios.usr_nombres) as smn_usuario_id,
	(select smn_salud.smn_rol.smn_usuario_id || ' - ' || smn_salud.smn_rol.rol_tipo from  smn_salud.smn_rol  where smn_salud.smn_rol.smn_rol_id is not null  and smn_salud.smn_rol.smn_rol_id=smn_salud.smn_planificacion_de_turno.smn_rol_id  order by smn_salud.smn_rol.rol_tipo ) as smn_rol_id,
	(select smn_salud.smn_series.sri_codigo || ' - ' || smn_salud.smn_series.sri_nombre from  smn_salud.smn_series  where smn_salud.smn_series.smn_series_id is not null  and smn_salud.smn_series.smn_series_id=smn_salud.smn_planificacion_de_turno.smn_serie_id  order by smn_salud.smn_series.sri_nombre ) as smn_serie_id,
	(select smn_base.smn_entidades.ent_codigo || ' - ' ||  smn_base.smn_entidades.ent_descripcion_corta from  smn_base.smn_entidades  where smn_base.smn_entidades.smn_entidades_id is not null  and smn_base.smn_entidades.smn_entidades_id=smn_salud.smn_planificacion_de_turno.smn_entidades_rf  order by smn_base.smn_entidades.ent_descripcion_corta ) as smn_entidades_rf,
	(select smn_base.smn_sucursales.suc_codigo || ' - ' ||  smn_base.smn_sucursales.suc_nombre from  smn_base.smn_sucursales  where smn_base.smn_sucursales.smn_sucursales_id is not null  and smn_base.smn_sucursales.smn_sucursales_id=smn_salud.smn_planificacion_de_turno.smn_sucursales_rf  order by smn_base.smn_sucursales.suc_nombre ) as smn_sucursales_rf,
	(select smn_base.smn_areas_servicios.ase_codigo || ' - ' ||  smn_base.smn_areas_servicios.ase_descripcion from  smn_base.smn_areas_servicios  where smn_base.smn_areas_servicios.smn_areas_servicios_id is not null  and smn_base.smn_areas_servicios.smn_areas_servicios_id=smn_salud.smn_planificacion_de_turno.smn_areas_servicios_rf  order by smn_base.smn_areas_servicios.ase_descripcion ) as smn_areas_servicios_rf,
	smn_salud.smn_planificacion_de_turno.smn_usuario_id,
	smn_salud.smn_planificacion_de_turno.smn_rol_id,
	smn_salud.smn_planificacion_de_turno.ptu_fecha,
	smn_salud.smn_planificacion_de_turno.smn_serie_id,
	smn_salud.smn_planificacion_de_turno.smn_entidades_rf,
	smn_salud.smn_planificacion_de_turno.smn_sucursales_rf,
	smn_salud.smn_planificacion_de_turno.smn_areas_servicios_rf
	
from
	smn_salud.smn_planificacion_de_turno
