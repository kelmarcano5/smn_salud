select	
	smn_activo_fijo.smn_activo.*
from
	smn_activo_fijo.smn_activo
	inner join smn_activo_fijo.smn_clase_activo on smn_activo_fijo.smn_clase_activo.smn_clase_activo_id = smn_activo_fijo.smn_activo.smn_activo_id
where
	smn_activo_id is not null
	${filter}