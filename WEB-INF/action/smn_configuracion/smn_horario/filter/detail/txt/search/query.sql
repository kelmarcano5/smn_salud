select
	case
	when smn_salud.smn_horario.hor_status='A' then '${lbl:b_hor_activo}'
	when smn_salud.smn_horario.hor_status='I' then '${lbl:b_hor_inactivo}'
	end as hor_status_combo,
	smn_salud.smn_horario.*
from
	smn_salud.smn_horario
where
	smn_horarios_id = ${fld:id}
