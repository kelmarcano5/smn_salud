select
		smn_salud.smn_tramos.trm_codigo,
	smn_salud.smn_tramos.trm_descripcion,
	smn_salud.smn_tramos.trm_dia_semana,
	smn_salud.smn_tramos.trm_fecha_registro
from
	smn_salud.smn_tramos 
where
	smn_salud.smn_tramos.smn_tramos_id = ${fld:id}
