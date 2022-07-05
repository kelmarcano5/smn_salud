select
		smn_salud.smn_observaciones.obs_descripcion
from
		smn_salud.smn_observaciones
where
		upper(smn_salud.smn_observaciones.obs_descripcion) = upper(${fld:obs_descripcion})
