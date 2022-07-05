INSERT INTO smn_inventario.smn_despacho
(
	smn_despacho_id,
	smn_modulo_rf,
	smn_documento_origen_id,
	des_numero_documento_origen,
	smn_usuario_solicitante_rf,
	smn_documento_id,
	des_numero_documento,
	des_descripcion,
	smn_entidad_rf,
	smn_sucursal_rf,
	smn_almacen_rf,
	smn_clase_auxiliar_rf,
	smn_auxiliar_rf,
	des_fecha_solicitud,
	des_estatus,
	des_monto_pedido_ml,
	des_monto_impuesto_ml,
	des_monto_descuento_ml,
	des_monto_bonificacion_ml,
	des_monto_neto_ml,
	des_idioma,
	des_usuario,
	des_fecha_registro,
	des_hora
)
VALUES
(
	${seq:nextval@smn_inventario.seq_smn_despacho},
	'1',
	${fld:smn_documento_id},
	${fld:smn_prestacion_servicio_medico_cabecera_id},
	(select smn_base.smn_usuarios.smn_usuarios_id from smn_base.smn_usuarios inner join smn_seguridad.s_user on smn_seguridad.s_user.user_id = smn_base.smn_usuarios.smn_user_rf where smn_seguridad.s_user.userlogin='${def:user}'),
	(select smn_inventario.smn_documento.smn_documento_id from smn_inventario.smn_documento where smn_inventario.smn_documento.smn_documento_general_rf=(select smn_salud.smn_documento.smn_documento_general_rf from smn_salud.smn_documento where smn_salud.smn_documento.smn_documento_id=${fld:smn_documento_id})),
	${seq:nextval@smn_inventario.seq_numero_documento_desp},
	'Generado desde Prestacion Servicio Medico Item',
	${fld:smn_entidades_rf},
	${fld:smn_sucursales_rf},
	(select case when smn_base.smn_almacen.smn_almacen_id is null then 0 else smn_base.smn_almacen.smn_almacen_id end as smn_almacen_id from smn_base.smn_almacen where smn_base.smn_almacen.alm_empresa=${fld:smn_entidades_rf} and smn_base.smn_almacen.alm_sucursal=${fld:smn_sucursales_rf} and smn_base.smn_almacen.alm_area_servicio=${fld:smn_areas_servicios_rf}),
	${fld:smn_clase_rf},
	${fld:smn_auxiliar_rf},
	{d '${def:date}'},
	'GE',
	0,
	0,
	0,
	0,
	0,
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
) RETURNING smn_despacho_id;