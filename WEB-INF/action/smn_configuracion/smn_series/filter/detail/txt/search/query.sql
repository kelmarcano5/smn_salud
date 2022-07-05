select
	case
	when smn_salud.smn_series.sri_estatus='A' then '${lbl:b_activo}'
	when smn_salud.smn_series.sri_estatus='I' then '${lbl:b_inactivo}'
	end as sri_estatus_combo,
	case
	when smn_salud.smn_series.sri_reinicio='T' then '${lbl:b_turno}'
	when smn_salud.smn_series.sri_reinicio='D' then '${lbl:b_diario}'
	when smn_salud.smn_series.sri_reinicio='S' then ' ${lbl:b_semanal}'
	when smn_salud.smn_series.sri_reinicio='M' then ' ${lbl:b_mensual}'
	end as sri_reinicio_combo,
	smn_salud.smn_series.*
from
	smn_salud.smn_series
where
	smn_serie_id = ${fld:id}
