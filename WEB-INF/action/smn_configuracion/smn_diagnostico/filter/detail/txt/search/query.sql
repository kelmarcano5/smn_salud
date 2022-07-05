select
	case
	when smn_salud.smn_diagnostico.dgn_tipo='1' then '${lbl:b_cie10}'
	when smn_salud.smn_diagnostico.dgn_tipo='2' then '${lbl:b_procedimientos}'
	when smn_salud.smn_diagnostico.dgn_tipo='3' then '${lbl:b_otra}'
	end as dgn_tipo_combo,
	smn_salud.smn_diagnostico.*
from
	smn_salud.smn_diagnostico
where
	smn_diagnostico_id = ${fld:id}
