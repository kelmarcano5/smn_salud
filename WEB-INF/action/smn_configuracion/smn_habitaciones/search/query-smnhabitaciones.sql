select
	smn_base.smn_tipos_servicios.tsr_descripcion,
	case
	when smn_salud.smn_habitaciones.hab_estatus='DI' then '${lbl:b_disponible}'
	when smn_salud.smn_habitaciones.hab_estatus='ND' then '${lbl:b_no_disponible}'
	when smn_salud.smn_habitaciones.hab_estatus='RE' then '${lbl:b_reservada}'
	end as hab_estatus,
	case
	when smn_salud.smn_habitaciones.hab_clase='A' then '${lbl:b_a}'
	when smn_salud.smn_habitaciones.hab_clase='B' then '${lbl:b_b}'
	when smn_salud.smn_habitaciones.hab_clase='C' then '${lbl:b_c}'
	end as hab_clase,
		smn_salud.smn_habitaciones.smn_habitaciones_id,
	smn_activo_fijo.smn_activo.act_descripcion as smn_activo_fijo_rf,
	smn_salud.smn_habitaciones.hab_codigo,
	smn_salud.smn_habitaciones.hab_descripcion,
	smn_salud.smn_habitaciones.hab_tipo_servicio,
	smn_salud.smn_habitaciones.hab_fecha_registro
	
from
	smn_salud.smn_habitaciones
	inner join smn_base.smn_tipos_servicios on smn_base.smn_tipos_servicios.smn_tipos_servicios_id = smn_salud.smn_habitaciones.hab_tipo_servicio
	left join smn_activo_fijo.smn_activo on  smn_activo_fijo.smn_activo.smn_activo_id = smn_salud.smn_habitaciones.smn_activo_fijo_rf

