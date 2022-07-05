select ${fld:smn_mov_caja_cabecera_id} as smn_mov_caja_cabecera_id, 
${fld:smn_documento_id} as smn_documento_id,
${fld:igs_monto_moneda_local} as igs_monto_moneda_local,
${fld:igs_monto_moneda_alternal} as igs_monto_moneda_alternal,
${fld:smn_moneda_rf} as smn_moneda_rf,
${fld:smn_tasa_rf} as smn_tasa_rf
from smn_salud.smn_ingresos 
inner join smn_salud.smn_cobertura_admision on smn_salud.smn_cobertura_admision.smn_ingreso_id = smn_salud.smn_ingresos.smn_ingresos_id
where smn_salud.smn_ingresos.smn_ingresos_id=${fld:smn_ingresos_id}

