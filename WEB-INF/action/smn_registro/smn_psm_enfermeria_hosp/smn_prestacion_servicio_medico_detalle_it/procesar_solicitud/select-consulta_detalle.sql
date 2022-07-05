SELECT DISTINCT
${fld:smn_pedido_cabecera_id}  as smn_pedido_cabecera_id,
${fld:smn_mov_caja_cabecera_id}  as smn_mov_caja_cabecera_id,
${fld:ingresoid} as ingresoid,
smn_salud.smn_prestacion_servicio_medico_detalle.smn_ingresos_mov_id,
smn_salud.smn_prestacion_servicio_medico_detalle.smn_servicios_rf,
smn_salud.smn_prestacion_servicio_medico_detalle.smn_moneda_rf,
smn_salud.smn_contratante.smn_baremos_id,
Sum(CASE
	when smn_base.smn_baremos_detalle.bad_precio_moneda_local is null then 0 else smn_base.smn_baremos_detalle.bad_precio_moneda_alterna*(select smn_base.smn_tasas_de_cambio.tca_tasa_cambio from smn_base.smn_tasas_de_cambio where smn_base.smn_tasas_de_cambio.tca_fecha_vigencia=CURRENT_DATE and smn_base.smn_tasas_de_cambio.tca_tipo_tasa=(select smn_salud.smn_documento.tca_tipo_tasa from smn_salud.smn_documento where smn_salud.smn_documento.smn_documento_id = (select smn_salud.smn_ingresos.smn_documento_id from smn_salud.smn_ingresos where smn_salud.smn_ingresos.smn_ingresos_id=${fld:ingresoid})) and smn_base.smn_tasas_de_cambio.tca_estatus in ('AC') limit 1)
END) AS monto_ml,
Sum(CASE
	when smn_base.smn_baremos_detalle.bad_precio_moneda_alterna is null then 0 else smn_base.smn_baremos_detalle.bad_precio_moneda_alterna
END) AS monto_ma,
smn_base.smn_baremos_detalle.bad_estatus,
smn_salud.smn_prestacion_servicio_medico_detalle.smn_prestacion_servicio_medico_cabecera_id
FROM
smn_salud.smn_prestacion_servicio_medico_detalle
INNER JOIN smn_salud.smn_ingresos ON smn_salud.smn_prestacion_servicio_medico_detalle.smn_ingresos_id = smn_salud.smn_ingresos.smn_ingresos_id
LEFT JOIN smn_salud.smn_contratante ON smn_salud.smn_ingresos.smn_contratante_id = smn_salud.smn_contratante.smn_contratante_id
INNER JOIN smn_base.smn_baremos_detalle ON smn_salud.smn_contratante.smn_baremos_id = smn_base.smn_baremos_detalle.smn_baremos_id AND smn_salud.smn_prestacion_servicio_medico_detalle.smn_item_rf = smn_base.smn_baremos_detalle.smn_item_rf
WHERE
smn_salud.smn_prestacion_servicio_medico_detalle.smn_ingresos_id = ${fld:ingresoid} AND
smn_salud.smn_prestacion_servicio_medico_detalle.psd_tipo_componentes = 'IT' AND
smn_base.smn_baremos_detalle.bad_estatus = 'A' AND
smn_salud.smn_prestacion_servicio_medico_detalle.psd_estatus IN ('RE')
GROUP BY
smn_salud.smn_prestacion_servicio_medico_detalle.smn_prestacion_servicio_medico_cabecera_id,
smn_salud.smn_prestacion_servicio_medico_detalle.smn_ingresos_mov_id,
smn_salud.smn_prestacion_servicio_medico_detalle.smn_servicios_rf,
smn_salud.smn_prestacion_servicio_medico_detalle.smn_moneda_rf,
smn_salud.smn_contratante.smn_baremos_id,
smn_base.smn_baremos_detalle.bad_estatus