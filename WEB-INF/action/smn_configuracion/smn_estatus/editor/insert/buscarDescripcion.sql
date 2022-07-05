select
		smn_salud.smn_estatus.sta_descripcion
from
		smn_salud.smn_estatus
where
		upper(smn_salud.smn_estatus.sta_descripcion) = upper(${fld:sta_descripcion})
