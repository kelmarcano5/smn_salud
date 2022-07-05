select
		smn_salud.smn_patologia.pat_descripcion
from
		smn_salud.smn_patologia
where
		upper(smn_salud.smn_patologia.pat_descripcion) = upper(${fld:pat_descripcion})
