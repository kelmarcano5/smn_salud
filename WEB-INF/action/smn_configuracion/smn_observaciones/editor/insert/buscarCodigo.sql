select
		smn_salud.smn_observaciones.obs_codigo
from
		smn_salud.smn_observaciones
where
		upper(smn_salud.smn_observaciones.obs_codigo) = upper(${fld:obs_codigo})
