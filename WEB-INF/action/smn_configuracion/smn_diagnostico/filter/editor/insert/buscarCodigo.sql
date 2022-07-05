select
		smn_salud.smn_diagnostico.dgn_codigo
from
		smn_salud.smn_diagnostico
where
		upper(smn_salud.smn_diagnostico.dgn_codigo) = upper(${fld:dgn_codigo})
