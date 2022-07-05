select
		smn_salud.smn_puesto_atencion.smn_puesto_atencion_id,
	case
	when smn_salud.smn_puesto_atencion.put_estatus='AC' then '${lbl:b_active}'
	when smn_salud.smn_puesto_atencion.put_estatus='IN' then '${lbl:b_inactive}'
	end as put_estatus_combo,
	smn_salud.smn_puesto_atencion.put_codigo,
	smn_salud.smn_puesto_atencion.put_descripcion,
	smn_salud.smn_puesto_atencion.put_estatus,
	smn_salud.smn_puesto_atencion.put_fecha_registro
	
from
	smn_salud.smn_puesto_atencion
