select
		smn_salud.smn_tipo_consulta.tcs_nombre
from
		smn_salud.smn_tipo_consulta
where
		upper(smn_salud.smn_tipo_consulta.tcs_nombre) = upper(${fld:tcs_nombre})
