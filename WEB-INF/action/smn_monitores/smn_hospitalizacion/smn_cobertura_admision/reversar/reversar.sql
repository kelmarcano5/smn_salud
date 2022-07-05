delete from smn_caja.smn_mov_caja_detalle where smn_mov_caja_cabecera_id = (select smn_caja.smn_mov_caja_cabecera.smn_mov_caja_cabecera_id from smn_caja.smn_mov_caja_cabecera where smn_caja.smn_mov_caja_cabecera.mcc_doc_referencia=(select cast(smn_salud.smn_ingresos.igs_num_ingreso as VARCHAR) from smn_salud.smn_ingresos where smn_salud.smn_ingresos.smn_ingresos_id=${fld:id}));
delete from smn_caja.smn_mov_caja_cabecera where smn_mov_caja_cabecera_id = (select smn_caja.smn_mov_caja_cabecera.smn_mov_caja_cabecera_id from smn_caja.smn_mov_caja_cabecera where smn_caja.smn_mov_caja_cabecera.mcc_doc_referencia=(select cast(smn_salud.smn_ingresos.igs_num_ingreso as VARCHAR) from smn_salud.smn_ingresos where smn_salud.smn_ingresos.smn_ingresos_id=${fld:id}));

-- UPDATE smn_salud.smn_cobertura_admision SET
-- 	coa_estatus_proceso='RE',
-- 	coa_estatus_financiero='PE'
-- WHERE
-- 	smn_ingresos_id=${fld:id};