select
	(select smn_base.smn_servicios.svc_codigo || ' - ' || smn_base.smn_servicios.svc_descripcion from  smn_base.smn_servicios  where smn_base.smn_servicios.smn_servicios_id is not null  and smn_base.smn_servicios.smn_servicios_id=smn_salud.smn_presupuesto_detalle.prd_servicio  order by 1 ) as prd_servicio_combo,
	smn_salud.smn_presupuesto_detalle.*
from 
	smn_salud.smn_presupuesto_detalle
where
	smn_presupuesto_detalle_id = ${fld:id}
