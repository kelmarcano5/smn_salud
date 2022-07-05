select
		smn_salud.smn_capacidades_unidad.smn_capacidades_id,
	smn_salud.smn_capacidades_unidad.smn_areas_servicios_rf,
	smn_salud.smn_capacidades_unidad.smn_unidad_servicio_rf,
	smn_salud.smn_capacidades_unidad.cap_cant_max_pacientes,
	smn_salud.smn_capacidades_unidad.cap_cant_min_pacientes,
	smn_salud.smn_capacidades_unidad.cap_fecha_registro
from
	smn_salud.smn_capacidades_unidad 
where
	smn_salud.smn_capacidades_unidad.smn_capacidades_id = ${fld:id}
