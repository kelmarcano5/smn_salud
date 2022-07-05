update 
	smn_salud.smn_presupuesto 
set 
	smn_ingresos_id = ${fld:smn_ingresos_id}
where
	smn_salud.smn_presupuesto.smn_presupuesto_id=${fld:smn_presupuesto_id};