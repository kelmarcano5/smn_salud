select
		smn_base.smn_auxiliar_clase.smn_auxiliar_clase_id,
	${field}
from
	smn_base.smn_auxiliar_clase
where
		smn_base.smn_auxiliar_clase.smn_auxiliar_clase_id is not null
	${filter}
	
	
