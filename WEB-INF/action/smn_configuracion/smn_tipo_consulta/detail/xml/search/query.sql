select
	smn_salud.smn_tipo_consulta.*
from
	smn_salud.smn_tipo_consulta
where
	smn_tipo_consulta_id = ${fld:id}
