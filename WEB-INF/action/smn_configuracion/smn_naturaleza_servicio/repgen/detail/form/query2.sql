select
		smn_salud.smn_naturaleza_servicio.smn_tipo_servicio_rf,
	smn_salud.smn_naturaleza_servicio.nts_naturaleza,
	smn_salud.smn_naturaleza_servicio.nts_fecha_registro
from
	smn_salud.smn_naturaleza_servicio 
where
	smn_salud.smn_naturaleza_servicio.smn_naturaleza_servicio_id = ${fld:id}
