select
	case
		when smn_salud.smn_puesto_atencion.put_estatus='AC' then '${lbl:b_active}'
		when smn_salud.smn_puesto_atencion.put_estatus='IN' then '${lbl:b_inactive}'
	end as put_estatus_combo,
	smn_salud.smn_puesto_atencion.*
from 
	smn_salud.smn_puesto_atencion
where
	smn_puesto_atencion_id = ${fld:id}
