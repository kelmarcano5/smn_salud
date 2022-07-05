select
		smn_salud.smn_estatus_citas.eci_num_secuencia,
	smn_salud.smn_estatus_citas.eci_descripcion,
	smn_salud.smn_estatus_citas.eci_aplica,
	smn_salud.smn_estatus_citas.eci_fecha_registro
from
	smn_salud.smn_estatus_citas 
where
	smn_salud.smn_estatus_citas.smn_estatus_citas_id = ${fld:id}
