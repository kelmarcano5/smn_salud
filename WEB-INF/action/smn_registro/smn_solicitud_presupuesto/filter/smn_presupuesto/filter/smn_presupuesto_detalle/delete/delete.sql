delete from smn_salud.smn_presupuesto_detalle_componente where smn_presupuesto_detalle_id = ${fld:id};
UPDATE smn_salud.smn_presupuesto SET 
	pre_monto_ml = smn_salud.smn_presupuesto.pre_monto_ml - smn_salud.smn_presupuesto_detalle.prd_monto_moneda_local
FROM smn_salud.smn_presupuesto_detalle
WHERE smn_salud.smn_presupuesto_detalle.smn_presupuesto_id = smn_salud.smn_presupuesto.smn_presupuesto_id and smn_presupuesto_detalle_id = ${fld:id};

delete from smn_salud.smn_presupuesto_detalle where smn_presupuesto_detalle_id = ${fld:id}
