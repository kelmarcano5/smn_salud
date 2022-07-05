select
		smn_salud.smn_diagnostico.dgn_descripcion
from
		smn_salud.smn_diagnostico
where
		upper(smn_salud.smn_diagnostico.dgn_descripcion) = upper(${fld:dgn_descripcion})
