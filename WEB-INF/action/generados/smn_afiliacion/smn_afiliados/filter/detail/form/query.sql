select
	case
		when smn_salud.smn_afiliados.afi_sexo='MA' then '${lbl:b_male}'
		when smn_salud.smn_afiliados.afi_sexo='FE' then '${lbl:b_female}'
	end as afi_sexo_combo,
	smn_salud.smn_afiliados.*
from 
	smn_salud.smn_afiliados
where
	smn_afiliados_id = ${fld:id}
