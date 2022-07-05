select
	case
	when smn_salud.smn_localidad.loc_status='A' then '${lbl:b_activa_local}'
	when smn_salud.smn_localidad.loc_status='I' then '${lbl:b_inactiva_local}'
	end as loc_status_combo,
	smn_salud.smn_localidad.loc_codigo,
	smn_salud.smn_localidad.loc_descripcion,
	smn_salud.smn_localidad.loc_status,
	smn_salud.smn_localidad.loc_fecha_registro,
		smn_salud.smn_localidad.smn_localidad_id
	
from
	smn_salud.smn_localidad
where
	smn_localidad_id is not null
	${filter}
order by
		smn_localidad_id
