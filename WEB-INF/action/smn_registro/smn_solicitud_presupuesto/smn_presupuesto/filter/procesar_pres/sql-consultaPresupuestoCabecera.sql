SELECT * 
FROM smn_salud.smn_presupuesto
inner join smn_salud.smn_ingresos on smn_salud.smn_ingresos.igs_doc_origen = smn_salud.smn_presupuesto.smn_presupuesto_id 
WHERE smn_presupuesto_id = ${fld:smn_presupuesto_id}