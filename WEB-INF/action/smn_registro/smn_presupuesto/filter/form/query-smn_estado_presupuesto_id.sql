select smn_salud.smn_estado_presupuesto.smn_estado_presupuesto_id as id, smn_salud.smn_estado_presupuesto.epr_codigo || ' - ' || smn_salud.smn_estado_presupuesto.epr_descripcion as item from smn_salud.smn_estado_presupuesto order by 2