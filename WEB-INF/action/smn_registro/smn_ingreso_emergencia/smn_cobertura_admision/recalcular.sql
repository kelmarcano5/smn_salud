UPDATE smn_salud.smn_ingresos
   SET igs_monto_cobertura = (select smn_salud.smn_cobertura_admision.coa_monto_total_aprobado_ml from smn_salud.smn_cobertura_admision
inner join smn_salud.smn_ingresos on smn_salud.smn_ingresos.smn_ingresos_id = smn_salud.smn_cobertura_admision.smn_ingreso_id where smn_salud.smn_cobertura_admision.smn_ingreso_id=${fld:id_ingreso}),
         igs_monto_cobertura_ma = (select smn_salud.smn_cobertura_admision.coa_monto_total_aprobado_ma from smn_salud.smn_cobertura_admision inner join smn_salud.smn_ingresos on smn_salud.smn_ingresos.smn_ingresos_id = smn_salud.smn_cobertura_admision.smn_ingreso_id where smn_salud.smn_cobertura_admision.smn_ingreso_id=${fld:id_ingreso})
 WHERE smn_ingresos_id = ${fld:id_ingreso}