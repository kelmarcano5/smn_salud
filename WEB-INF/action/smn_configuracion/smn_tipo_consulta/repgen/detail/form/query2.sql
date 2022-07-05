select
		smn_salud.smn_tipo_consulta.tcs_codigo,
	smn_salud.smn_tipo_consulta.tcs_nombre,
	smn_salud.smn_tipo_consulta.tcs_fecha_registro
from
	smn_salud.smn_tipo_consulta 
where
	smn_salud.smn_tipo_consulta.smn_tipo_consulta_id = ${fld:id}
