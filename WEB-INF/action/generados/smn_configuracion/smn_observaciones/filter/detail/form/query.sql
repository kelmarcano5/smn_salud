select
	case
		when smn_salud.smn_observaciones.obs_tipo='OC' then '${lbl:b_obscita}'
		when smn_salud.smn_observaciones.obs_tipo='OI' then '${lbl:b_obsingreso}'
	end as obs_tipo_combo,
	smn_salud.smn_observaciones.*
from 
	smn_salud.smn_observaciones
where
	smn_observaciones_id = ${fld:id}
