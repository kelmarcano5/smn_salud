select
	case
		when smn_salud.smn_patologia.pat_estatus='AC' then '${lbl:b_active}'
		when smn_salud.smn_patologia.pat_estatus='IN' then '${lbl:b_inactive}'
	end as pat_estatus,
	smn_salud.smn_patologia.*
from 
	smn_salud.smn_patologia
where
	smn_patologia_id = ${fld:id}
