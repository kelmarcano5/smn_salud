UPDATE smn_salud.smn_cobertura_admision SET
	coa_estatus_proceso='GE',
	coa_estatus_financiero='AP'
WHERE
	smn_salud.smn_cobertura_admision.smn_ingreso_id=${fld:smn_ingresos_id};


UPDATE smn_salud.smn_ingresos SET 
	igs_monto_cobertura=(select smn_salud.smn_cobertura_admision.coa_monto_total_aprobado_ml from smn_salud.smn_cobertura_admision where smn_salud.smn_cobertura_admision.smn_ingreso_id=${fld:smn_ingresos_id}),
	igs_monto_cobertura_ma=(select smn_salud.smn_cobertura_admision.coa_monto_total_aprobado_ma from smn_salud.smn_cobertura_admision where smn_salud.smn_cobertura_admision.smn_ingreso_id=${fld:smn_ingresos_id})
WHERE
	smn_ingresos_id=${fld:smn_ingresos_id};