select
	case
	when smn_salud.smn_no_registrados.nfi_sexo='MA' then '${lbl:b_male}'
	when smn_salud.smn_no_registrados.nfi_sexo='FE' then '${lbl:b_female}'
	end as nfi_sexo_combo,
	smn_salud.smn_no_registrados.*
from
	smn_salud.smn_no_registrados
where
	smn_no_registrados_id = ${fld:id}
