setComboValue('smn_prestacion_servicio_medico_cabecera_id','${fld:smn_prestacion_servicio_medico_cabecera_id}','form1');
setComboValue('smn_ingresos_mov_id','${fld:smn_ingresos_mov_id}','form1');
setComboValue('smn_rol_id','${fld:smn_rol_id}','form1');
setComboValue('smn_mov_caja_detalle_id','${fld:smn_mov_caja_detalle_id}','form1');
setComboValue('smn_unidades_servicios_rf','${fld:smn_unidades_servicios_rf}','form1');
setComboValue('smn_almacen_rf','${fld:smn_almacen_rf}','form1');
setComboValue('smn_servicios_rf','${fld:smn_servicios_rf}','form1');
setComboValue('psd_tipo_componentes','${fld:psd_tipo_componentes}','form1');
setComboValue('smn_componentes_rf','${fld:smn_componentes_rf}','form1');
setComboValue('smn_item_rf','${fld:smn_item_rf}','form1');
setComboValue('smn_prestador_servicio_rf','${fld:smn_prestador_servicio_rf}','form1');
document.form1.psd_cantidad.value='${fld:psd_cantidad@#,###,##0.00}';
document.form1.psd_precio_propuesto_ml.value='${fld:psd_precio_propuesto_ml@#,###,##0.00}';
document.form1.psd_monto_propuesto_ml.value='${fld:psd_monto_propuesto_ml@#,###,##0.00}';
document.form1.smn_descuento_ml_rf.value='${fld:smn_descuento_ml_rf@#,###,###}';
setComboValue('smn_moneda_rf','${fld:smn_moneda_rf}','form1');
document.form1.psd_precio_propuesto_ma.value='${fld:psd_precio_propuesto_ma@#,###,##0.00}';
document.form1.psd_monto_propuesto_ma.value='${fld:psd_monto_propuesto_ma@#,###,##0.00}';
document.form1.psd_monto_descuento_propuesto_ml.value='${fld:psd_monto_descuento_propuesto_ml@#,###,###}';
document.form1.psd_monto_descuento_propuesto_ma.value='${fld:psd_monto_descuento_propuesto_ma@#,###,###}';
document.form1.psd_monto_neto_propuesto_ml.value='${fld:psd_monto_neto_propuesto_ml@#,###,###}';
document.form1.psd_monto_neto_propuesto_ma.value='${fld:psd_monto_neto_propuesto_ma@#,###,###}';
setComboValue('psd_estatus','${fld:psd_estatus}','form1');
setComboValue('psd_agregado_usuario','${fld:psd_agregado_usuario}','form1');
setComboValue('psd_observaciones_rf','${fld:psd_observaciones_rf}','form1');
document.form1.id.value='${fld:smn_prestacion_servicio_medico_detalle_id@#######}';

document.form1.smn_ingresos_id.value='${fld:smn_ingresos_id@#######}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

