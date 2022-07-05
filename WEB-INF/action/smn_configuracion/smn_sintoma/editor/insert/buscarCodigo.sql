select
		smn_salud.smn_sintoma.stm_codigo
from
		smn_salud.smn_sintoma
where
		upper(smn_salud.smn_sintoma.stm_codigo) = upper(${fld:stm_codigo})
