select
		smn_salud.smn_presupuesto_detalle.smn_presupuesto_id,
	smn_salud.smn_presupuesto_detalle.smn_servicios_rf,
	smn_salud.smn_presupuesto_detalle.prd_cantidad,
	smn_salud.smn_presupuesto_detalle.prd_precio,
	smn_salud.smn_presupuesto_detalle.smn_moneda_rf,
	smn_salud.smn_presupuesto_detalle.prd_precio_ma,
	smn_salud.smn_presupuesto_detalle.prd_monto_moneda_local,
	smn_salud.smn_presupuesto_detalle.prd_moneda_alterna,
	smn_salud.smn_presupuesto_detalle.prd_fecha_registro
from
	smn_salud.smn_presupuesto_detalle 
where
	smn_salud.smn_presupuesto_detalle.smn_presupuesto_detalle_id = ${fld:id}
