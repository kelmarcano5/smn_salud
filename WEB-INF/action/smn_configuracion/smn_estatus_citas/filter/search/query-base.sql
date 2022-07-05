select
	case
	when smn_salud.smn_estatus_citas.eci_aplica='CI' then 'Citas'
	when smn_salud.smn_estatus_citas.eci_aplica='IG' then 'Ingreso'
	end as eci_aplica_combo,
	smn_salud.smn_estatus_citas.eci_num_secuencia,
	smn_salud.smn_estatus_citas.eci_descripcion,
	smn_salud.smn_estatus_citas.eci_aplica,
	smn_salud.smn_estatus_citas.eci_fecha_registro,
		smn_salud.smn_estatus_citas.smn_estatus_citas_id
	
from
	smn_salud.smn_estatus_citas
where
	smn_estatus_citas_id is not null
	${filter}
order by
		smn_estatus_citas_id
