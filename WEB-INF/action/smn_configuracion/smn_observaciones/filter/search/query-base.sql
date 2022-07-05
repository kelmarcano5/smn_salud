select
	case
	when smn_salud.smn_observaciones.obs_tipo='OC' then '${lbl:b_obscita}'
	when smn_salud.smn_observaciones.obs_tipo='OI' then '${lbl:b_obsingreso}'
	end as obs_tipo_combo,
	smn_salud.smn_observaciones.obs_codigo,
	smn_salud.smn_observaciones.obs_descripcion,
	smn_salud.smn_observaciones.obs_tipo,
	smn_salud.smn_observaciones.obs_fecha_registro,
		smn_salud.smn_observaciones.smn_observaciones_id
	
from
	smn_salud.smn_observaciones
where
	smn_observaciones_id is not null
	${filter}
order by
		smn_observaciones_id
