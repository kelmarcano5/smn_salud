select
	case
	when smn_salud.smn_tramos.trm_dia_semana='LU' then '${lbl:b_trm_lunes}'
	when smn_salud.smn_tramos.trm_dia_semana='MA' then '${lbl:b_trm_martes}'
	when smn_salud.smn_tramos.trm_dia_semana='MI' then '${lbl:b_trm_miercoles}'
	when smn_salud.smn_tramos.trm_dia_semana='JU' then '${lbl:b_trm_jueves}'
	when smn_salud.smn_tramos.trm_dia_semana='VI' then '${lbl:b_trm_viernes}'
	when smn_salud.smn_tramos.trm_dia_semana='SA' then '${lbl:b_trm_sabado}'
	when smn_salud.smn_tramos.trm_dia_semana='DO' then '${lbl:b_trm_domingo}'
	end as trm_dia_semana_combo,
	smn_salud.smn_tramos.*
from
	smn_salud.smn_tramos
where
	smn_tramos_id = ${fld:id}
