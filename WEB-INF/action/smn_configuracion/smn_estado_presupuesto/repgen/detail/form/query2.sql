select
		smn_salud.smn_estado_presupuesto.epr_codigo,
	smn_salud.smn_estado_presupuesto.epr_descripcion,
	smn_salud.smn_estado_presupuesto.epr_fecha_registro
from
	smn_salud.smn_estado_presupuesto 
where
	smn_salud.smn_estado_presupuesto.smn_estado_presupuesto_id = ${fld:id}
