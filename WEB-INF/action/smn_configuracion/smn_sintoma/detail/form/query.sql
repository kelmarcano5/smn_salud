select
	smn_salud.smn_sintoma.*
from
	smn_salud.smn_sintoma
where
	smn_sintoma_id = ${fld:id}
