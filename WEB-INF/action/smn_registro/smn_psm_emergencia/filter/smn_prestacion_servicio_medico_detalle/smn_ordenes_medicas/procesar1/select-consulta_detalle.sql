 SELECT DISTINCT
    ${fld:smn_pedido_cabecera_id}  as smn_pedido_cabecera_id,
    ${fld:smn_mov_caja_cabecera_id}  as smn_mov_caja_cabecera_id,
    ${fld:smn_ingreso_id} as ingresoid,
     ${fld:smn_ordenes_medicas_id} as smn_ordenes_medicas_id,
CASE
    when smn_base.smn_baremos_detalle.bad_precio_moneda_local is null then 0 else smn_base.smn_baremos_detalle.bad_precio_moneda_alterna*(select smn_base.smn_tasas_de_cambio.tca_tasa_cambio from smn_base.smn_tasas_de_cambio where smn_base.smn_tasas_de_cambio.tca_fecha_vigencia=CURRENT_DATE and smn_base.smn_tasas_de_cambio.tca_tipo_tasa=(select smn_salud.smn_documento.tca_tipo_tasa from smn_salud.smn_documento where smn_salud.smn_documento.smn_documento_id = (select smn_salud.smn_ingresos.smn_documento_id from smn_salud.smn_ingresos where smn_salud.smn_ingresos.smn_ingresos_id=${fld:smn_ingreso_id})))
END AS smn_precio_ml,
CASE
    when smn_base.smn_baremos_detalle.bad_precio_moneda_alterna is null then 0 else smn_base.smn_baremos_detalle.bad_precio_moneda_alterna
END AS smn_precio_ma,
smn_salud.smn_ordenes_medicas.smn_ingreso_id,
smn_salud.smn_ordenes_medicas.omd_numero_orden,
smn_salud.smn_rel_orden_medica_servicios.smn_servicios_rf,
smn_salud.smn_ingresos.smn_contratante_id,
smn_base.smn_baremos_detalle.bad_precio_moneda_local,
smn_base.smn_baremos_detalle.bad_precio_moneda_alterna

FROM
smn_salud.smn_ordenes_medicas
INNER JOIN smn_salud.smn_rel_orden_medica_servicios ON smn_salud.smn_ordenes_medicas.smn_ordenes_medicas_id = smn_salud.smn_rel_orden_medica_servicios.smn_ordenes_medicas_id
INNER JOIN smn_salud.smn_ingresos ON smn_salud.smn_ordenes_medicas.smn_ingreso_id = smn_salud.smn_ingresos.smn_ingresos_id
INNER JOIN smn_salud.smn_contratante ON smn_salud.smn_ingresos.smn_contratante_id = smn_salud.smn_contratante.smn_contratante_id
INNER JOIN smn_base.smn_baremos_detalle ON smn_salud.smn_contratante.smn_baremos_id = smn_base.smn_baremos_detalle.smn_baremos_id AND smn_salud.smn_rel_orden_medica_servicios.smn_servicios_rf = smn_base.smn_baremos_detalle.smn_servicios_rf
WHERE
smn_salud.smn_ordenes_medicas.smn_ordenes_medicas_id = ${fld:smn_ordenes_medicas_id} and smn_salud.smn_ordenes_medicas.smn_ingreso_id=${fld:smn_ingreso_id} and smn_base.smn_baremos_detalle.bad_estatus='A'
