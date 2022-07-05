select
		smn_salud.smn_tipo_consulta.tcs_codigo
from
		smn_salud.smn_tipo_consulta
where
		upper(smn_salud.smn_tipo_consulta.tcs_codigo) = upper(${fld:tcs_codigo})
