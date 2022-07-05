select
		smn_salud.smn_puesto_atencion.put_codigo,
	smn_salud.smn_puesto_atencion.put_descripcion,
	smn_salud.smn_puesto_atencion.put_estatus,
	smn_salud.smn_puesto_atencion.put_fecha_registro
from
	smn_salud.smn_puesto_atencion 
where
	smn_salud.smn_puesto_atencion.smn_puesto_atencion_id = ${fld:id}
