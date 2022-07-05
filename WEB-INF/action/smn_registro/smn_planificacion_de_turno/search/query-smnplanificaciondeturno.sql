select
	smn_salud.smn_planificacion_de_turno.smn_plan_turno_id as smn_planificacion_de_turno_id,
	smn_salud.smn_planificacion_de_turno.ptu_fecha,
	smn_base.smn_entidades.ent_descripcion_corta as smn_entidades_rf,
	smn_base.smn_sucursales.suc_nombre as smn_sucursales_rf,
	smn_base.smn_areas_servicios.ase_descripcion as smn_areas_servicios_rf,
	usuario.aux_descripcion as smn_usuario_id,
	smn_salud.smn_series.sri_nombre as smn_serie_id,
	case
		when smn_salud.smn_planificacion_de_turno.ptu_estatus='AC' THEN '${lbl:b_active}' else '${lbl:b_inactive}'
	end as ptu_estatus,
	smn_salud.smn_planificacion_de_turno.ptu_fecha_registro,
	smn_base.smn_usuarios.smn_usuarios_id,
	smn_base.smn_entidades.smn_entidades_id,
	smn_base.smn_areas_servicios.smn_areas_servicios_id,
	smn_base.smn_sucursales.smn_sucursales_id, 
	smn_base.smn_unidades_servicios.smn_unidades_servicios_id,
	smn_salud.smn_series.smn_series_id, 
	(select 
		case
		when smn_salud.smn_rol.rol_tipo='SO' then '${lbl:b_solicitante}'
		when smn_salud.smn_rol.rol_tipo='AP' then '${lbl:b_autorizador}'
		when smn_salud.smn_rol.rol_tipo='AM' then '${lbl:b_ambos}'
	end
	from  smn_salud.smn_rol  where smn_salud.smn_rol.smn_rol_id is not null  and smn_salud.smn_rol.smn_rol_id=smn_salud.smn_planificacion_de_turno.smn_rol_id  order by smn_salud.smn_rol.rol_tipo ) as smn_rol_id


from 
	smn_salud.smn_planificacion_de_turno
	inner join smn_base.smn_entidades on smn_base.smn_entidades.smn_entidades_id = smn_salud.smn_planificacion_de_turno.smn_entidades_rf
	inner join smn_base.smn_areas_servicios on smn_base.smn_areas_servicios.smn_areas_servicios_id = smn_salud.smn_planificacion_de_turno.smn_areas_servicios_rf
	left join smn_base.smn_sucursales on smn_base.smn_sucursales.smn_sucursales_id = smn_salud.smn_planificacion_de_turno.smn_sucursales_rf
	left join smn_base.smn_unidades_servicios on smn_base.smn_unidades_servicios.smn_unidades_servicios_id = smn_salud.smn_planificacion_de_turno.smn_unidad_servicio_rf
	inner join smn_base.smn_usuarios on smn_base.smn_usuarios.smn_usuarios_id = smn_salud.smn_planificacion_de_turno.smn_usuario_id
	left join smn_base.smn_auxiliar usuario on usuario.smn_auxiliar_id = smn_base.smn_usuarios.smn_auxiliar_rf
	inner join smn_salud.smn_series on smn_salud.smn_series.smn_series_id = smn_salud.smn_planificacion_de_turno.smn_serie_id
ORDER BY smn_salud.smn_planificacion_de_turno.ptu_fecha_registro desc
