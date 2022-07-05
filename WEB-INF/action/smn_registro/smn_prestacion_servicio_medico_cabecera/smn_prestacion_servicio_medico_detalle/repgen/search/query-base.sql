select
	smn_salud.smn_observaciones.obs_descripcion,
		smn_salud.smn_prestacion_servicio_medico_detalle.smn_prestacion_servicio_medico_detalle_id,
	${field}
from
	smn_salud.smn_prestacion_servicio_medico_detalle
	left outer join smn_salud.smn_observaciones on smn_salud.smn_observaciones.smn_observaciones_id = smn_salud.smn_prestacion_servicio_medico_detalle.psd_observaciones_rf
where
		smn_salud.smn_prestacion_servicio_medico_detalle.smn_prestacion_servicio_medico_detalle_id is not null
	${filter}
	
	
