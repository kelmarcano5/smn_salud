select
		smn_salud.smn_tramos.trm_descripcion
from
		smn_salud.smn_tramos
where
		upper(smn_salud.smn_tramos.trm_descripcion) = upper(${fld:trm_descripcion})
