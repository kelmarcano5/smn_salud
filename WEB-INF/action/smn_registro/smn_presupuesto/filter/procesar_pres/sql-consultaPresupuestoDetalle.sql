SELECT * FROM smn_salud.smn_presupuesto_detalle
inner join smn_salud.smn_presupuesto on smn_salud.smn_presupuesto.smn_presupuesto_id = smn_salud.smn_presupuesto_detalle.smn_presupuesto_id
inner join smn_salud.smn_ingresos on smn_salud.smn_ingresos.igs_doc_origen = smn_salud.smn_presupuesto.smn_presupuesto_id
inner join smn_salud.smn_diagnostico_cab_auto on smn_salud.smn_diagnostico_cab_auto.smn_ingresos_id = smn_salud.smn_ingresos.smn_ingresos_id
WHERE smn_salud.smn_presupuesto_detalle.smn_presupuesto_id = ${fld:smn_presupuesto_id}