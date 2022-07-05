select
		smn_salud.smn_planes.pla_codigo
from
		smn_salud.smn_planes
where
		upper(smn_salud.smn_planes.pla_codigo) = upper(${fld:pla_codigo})
