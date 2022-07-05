select
		smn_salud.smn_origen.ori_codigo,
	smn_salud.smn_origen.ori_descripcion,
	smn_salud.smn_origen.ori_tipo,
	smn_salud.smn_origen.ori_fecha_registro
from
	smn_salud.smn_origen 
where
	smn_salud.smn_origen.smn_origen_id = ${fld:id}
