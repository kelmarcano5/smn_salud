select
		smn_salud.smn_patologia.pat_codigo
from
		smn_salud.smn_patologia
where
		upper(smn_salud.smn_patologia.pat_codigo) = upper(${fld:pat_codigo})
