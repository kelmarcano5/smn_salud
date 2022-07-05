select
		smn_salud.smn_estatus.sta_codigo
from
		smn_salud.smn_estatus
where
		upper(smn_salud.smn_estatus.sta_codigo) = upper(${fld:sta_codigo})
