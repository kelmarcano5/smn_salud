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
	smn_base.smn_auxiliar.aux_apellidos ||' - '|| smn_base.smn_auxiliar.aux_nombres as smn_contratante_id_name,
	smn_salud.smn_series.*
from
	smn_salud.smn_series
	left join smn_salud.smn_contratante on smn_salud.smn_contratante.smn_contratante_id = smn_salud.smn_series.smn_contratante_id
	left join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_salud.smn_contratante.smn_auxiliar_rf
where
	smn_series_id = ${fld:id}
