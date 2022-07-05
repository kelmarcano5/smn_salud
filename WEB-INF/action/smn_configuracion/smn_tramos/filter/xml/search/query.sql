select
		smn_salud.smn_tramos.smn_tramos_id,
	case
	when smn_salud.smn_tramos.trm_dia_semana='LU' then '${lbl:b_trm_lunes}'
	when smn_salud.smn_tramos.trm_dia_semana='MA' then '${lbl:b_trm_martes}'
	when smn_salud.smn_tramos.trm_dia_semana='MI' then '${lbl:b_trm_miercoles}'
	when smn_salud.smn_tramos.trm_dia_semana='JU' then '${lbl:b_trm_jueves}'
	when smn_salud.smn_tramos.trm_dia_semana='VI' then '${lbl:b_trm_viernes}'
	when smn_salud.smn_tramos.trm_dia_semana='SA' then '${lbl:b_trm_sabado}'
	when smn_salud.smn_tramos.trm_dia_semana='DO' then '${lbl:b_trm_domingo}'
	end as trm_dia_semana_combo,
		smn_salud.smn_tramos.smn_tramos_id,
	smn_salud.smn_tramos.trm_codigo,
	smn_salud.smn_tramos.trm_descripcion,
	smn_salud.smn_tramos.trm_dia_semana,
	smn_salud.smn_tramos.trm_hora_inicio,
	smn_salud.smn_tramos.trm_hora_fin,
	smn_salud.smn_tramos.trm_fecha_registro
	
from
	smn_salud.smn_tramos
