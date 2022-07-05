select
	smn_base.smn_tipos_servicios.tsr_descripcion,
		smn_salud.smn_habitaciones.smn_habitaciones_id,
	${field}
from
	smn_base.smn_tipos_servicios,
	smn_salud.smn_habitaciones
where
	smn_base.smn_tipos_servicios.smn_tipos_servicios_id = smn_salud.smn_habitaciones.hab_tipo_servicio and
		smn_salud.smn_habitaciones.smn_habitaciones_id is not null
	${filter}
	
	
