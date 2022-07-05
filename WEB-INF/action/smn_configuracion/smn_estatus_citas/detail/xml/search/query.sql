select
	case
	when smn_salud.smn_estatus_citas.eci_aplica='CI' then 'Citas'
	when smn_salud.smn_estatus_citas.eci_aplica='IG' then 'Ingreso'
	end as eci_aplica_combo,
	smn_salud.smn_estatus_citas.*
from
	smn_salud.smn_estatus_citas
where
	smn_estatus_citas_id = ${fld:id}
