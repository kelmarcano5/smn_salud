select
		smn_salud.smn_sintoma.stm_descripcion
from
		smn_salud.smn_sintoma
where
		upper(smn_salud.smn_sintoma.stm_descripcion) = upper(${fld:stm_descripcion})
