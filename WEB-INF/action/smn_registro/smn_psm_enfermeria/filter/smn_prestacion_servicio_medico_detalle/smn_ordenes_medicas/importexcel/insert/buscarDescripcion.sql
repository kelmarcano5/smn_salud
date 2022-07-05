select
		smn_salud.smn_ordenes_medicas.omd_descripcion
from
		smn_salud.smn_ordenes_medicas
where
		upper(smn_salud.smn_ordenes_medicas.omd_descripcion) = upper(${fld:omd_descripcion})
