select
		smn_salud.smn_habitaciones.smn_activo_fijo_rf,
	smn_salud.smn_habitaciones.hab_codigo,
	smn_salud.smn_habitaciones.hab_descripcion,
	smn_salud.smn_habitaciones.hab_estatus,
	smn_salud.smn_habitaciones.hab_clase,
	smn_salud.smn_habitaciones.hab_tipo_servicio,
	smn_salud.smn_habitaciones.hab_fecha_registro
from
	smn_salud.smn_habitaciones 
where
	smn_salud.smn_habitaciones.smn_habitaciones_id = ${fld:id}
