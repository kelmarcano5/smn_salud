select
		smn_salud.smn_observaciones.obs_codigo,
	smn_salud.smn_observaciones.obs_descripcion,
	smn_salud.smn_observaciones.obs_tipo,
	smn_salud.smn_observaciones.obs_fecha_registro
from
	smn_salud.smn_observaciones 
where
	smn_salud.smn_observaciones.smn_observaciones_id = ${fld:id}
