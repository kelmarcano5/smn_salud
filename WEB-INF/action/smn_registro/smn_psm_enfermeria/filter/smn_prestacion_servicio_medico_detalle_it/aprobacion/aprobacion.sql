UPDATE smn_inventario.smn_despacho SET
	des_estatus='AP'
WHERE
	smn_inventario.smn_despacho.smn_despacho_id=(select des_numero_documento_origen from smn_inventario.smn_despacho where smn_inventario.smn_despacho.smn_despacho_id=${fld:id2});


UPDATE smn_inventario.smn_despacho_detalle SET
	dde_estatus_transaccion='AP'
WHERE
	smn_inventario.smn_despacho_detalle.smn_despacho_id=(select des_numero_documento_origen from smn_inventario.smn_despacho where smn_inventario.smn_despacho.smn_despacho_id=${fld:id2});

UPDATE smn_salud.smn_prestacion_servicio_medico_detalle SET
	psd_estatus='AP'
WHERE
	smn_prestacion_servicio_medico_cabecera_id=${fld:id2};

UPDATE smn_salud.smn_prestacion_servicio_medico_cabecera SET
	psc_estatus='AP'
WHERE
	smn_prestacion_servicio_medico_cabecera_id=${fld:id2};
	
