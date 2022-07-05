select
		smn_salud.smn_estatus.sta_codigo,
	smn_salud.smn_estatus.sta_descripcion,
	smn_salud.smn_estatus.sta_fecha_registro,
	smn_salud.smn_estatus.est_codigo,
	smn_salud.smn_estatus.est_descripcion,
	smn_salud.smn_estatus.est_fecha_registro
from
	smn_salud.smn_estatus 
where
	smn_salud.smn_estatus.smn_estatus_id = ${fld:id}
