select 
	smn_salud.smn_ingresos.smn_ingresos_id as smn_ingresos_id,
	smn_caja.smn_mov_caja_cabecera.smn_mov_caja_cabecera_id as smn_mov_caja_cabecera_id,
  smn_salud.smn_ingreso_movimiento.smn_unidades_servicios_rf as smn_unidades_servicios_rf
from smn_salud.smn_ingresos
	inner join smn_salud.smn_ingreso_movimiento on smn_salud.smn_ingreso_movimiento.smn_ingreso_id = smn_salud.smn_ingresos.smn_ingresos_id
	left join smn_caja.smn_mov_caja_cabecera on smn_caja.smn_mov_caja_cabecera.smn_num_doc_origen_rf = smn_salud.smn_ingresos.igs_num_ingreso
WHERE
	smn_salud.smn_ingresos.smn_ingresos_id = ${fld:id_ingreso} limit 1