select
		smn_base.smn_auxiliar_clase.smn_clase_auxiliar_id
from
		smn_base.smn_auxiliar_clase
where
		smn_base.smn_auxiliar_clase.smn_clase_auxiliar_id = ${fld:smn_clase_auxiliar_id} and smn_base.smn_auxiliar_clase.smn_auxiliar_id=${fld:smn_auxiliar_id}
