select
		smn_salud.smn_planes.pla_descripcion
from
		smn_salud.smn_planes
where
		upper(smn_salud.smn_planes.pla_descripcion) = upper(${fld:pla_descripcion})
