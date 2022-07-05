select
		smn_salud.smn_tramos.trm_codigo
from
		smn_salud.smn_tramos
where
		upper(smn_salud.smn_tramos.trm_codigo) = upper(${fld:trm_codigo})
