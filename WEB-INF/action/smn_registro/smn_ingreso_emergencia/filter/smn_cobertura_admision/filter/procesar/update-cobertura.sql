UPDATE smn_salud.smn_cobertura_admision SET
	coa_estatus_proceso='AP',
	coa_estatus_financiero='AP'
WHERE
	smn_ingreso_id=${fld:smn_ingresos_id};

UPDATE smn_salud.smn_ingreso_movimiento SET 
	inm_estatus='AC'
WHERE 
	smn_ingreso_id=${fld:smn_ingresos_id};