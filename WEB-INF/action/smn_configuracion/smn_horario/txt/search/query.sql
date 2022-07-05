select
		smn_salud.smn_horario.smn_horarios_id,
	case
	when smn_salud.smn_horario.hor_status='A' then '${lbl:b_hor_activo}'
	when smn_salud.smn_horario.hor_status='I' then '${lbl:b_hor_inactivo}'
	end as hor_status_combo,
	smn_salud.smn_horario.hor_codigo,
	smn_salud.smn_horario.hor_descripcion,
	smn_salud.smn_horario.hor_status,
	smn_salud.smn_horario.hor_fecha_registro
	
from
	smn_salud.smn_horario
