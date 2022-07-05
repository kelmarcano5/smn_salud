delete from smn_salud.smn_ingreso_movimiento where inm_num_orden_medica=${fld:id};

delete from smn_salud.smn_prestacion_servicio_medico_detalle where smn_pedido_cabecera_id=${fld:id};

delete from smn_salud.smn_prestacion_servicio_medico_cabecera where smn_pedido_cabecera_id=${fld:id};

UPDATE smn_caja.smn_mov_caja_cabecera SET
	smn_estatus_cobro='PE',
	mcc_estatus_registro='RE'
WHERE
	smn_caja.smn_mov_caja_cabecera.smn_mov_caja_cabecera_id=${fld:caja_id}; --AND smn_estatus_cobro='CR'
