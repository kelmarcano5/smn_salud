UPDATE smn_salud.smn_cobertura_admision SET
	coa_observacion_inicial=${fld:coa_observacion_inicial},
	coa_fecha_aprobacion=${fld:coa_fecha_aprobacion},
	coa_hora_aprobacion=${fld:coa_hora_aprobacion},
	coa_estatus_proceso='AP',
	coa_monto_total_aprobado_ml = ${fld:coa_monto_total_solicitado_ml} - ${fld:coa_monto_deducible_ml},
	coa_monto_total_aprobado_ma = ${fld:coa_monto_total_solicitado_ma} - ${fld:coa_monto_deducible_ma}

WHERE
	smn_cobertura_admision_id=${fld:id};

UPDATE smn_salud.smn_ingresos
   SET 
   igs_monto_cobertura = (select SUM(smn_salud.smn_cobertura_admision.coa_monto_total_aprobado_ml) + SUM(smn_salud.smn_cobertura_admision.coa_monto_deducible_ml) from smn_salud.smn_cobertura_admision
   inner join smn_salud.smn_ingresos on smn_salud.smn_ingresos.smn_ingresos_id = smn_salud.smn_cobertura_admision.smn_ingreso_id where smn_salud.smn_cobertura_admision.smn_ingreso_id=(select smn_salud.smn_cobertura_admision.smn_ingreso_id from smn_salud.smn_cobertura_admision 
   where smn_salud.smn_cobertura_admision.smn_cobertura_admision_id =${fld:id})),     
   igs_monto_cobertura_ma = (select SUM(smn_salud.smn_cobertura_admision.coa_monto_total_aprobado_ma) + SUM(smn_salud.smn_cobertura_admision.coa_monto_deducible_ma) from smn_salud.smn_cobertura_admision 
   inner join smn_salud.smn_ingresos on smn_salud.smn_ingresos.smn_ingresos_id = smn_salud.smn_cobertura_admision.smn_ingreso_id 
   where smn_salud.smn_cobertura_admision.smn_ingreso_id=(select smn_salud.smn_cobertura_admision.smn_ingreso_id from smn_salud.smn_cobertura_admision where smn_salud.smn_cobertura_admision.smn_cobertura_admision_id =${fld:id}))
 WHERE smn_ingresos_id = (select smn_salud.smn_cobertura_admision.smn_ingreso_id from smn_salud.smn_cobertura_admision where smn_salud.smn_cobertura_admision.smn_cobertura_admision_id =${fld:id});

