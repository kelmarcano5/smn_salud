setComboValue('smn_contrato_base_rf','${fld:smn_contrato_base_rf}','form1');
setComboValue('smn_documento_id','${fld:smn_documento_id}','form1');
document.form1.ctm_numero_contrato.value='${fld:ctm_numero_contrato@#,###,###}';
setComboValue('smn_contratante_id','${fld:smn_contratante_id}','form1');
document.form1.ctm_fecha_vigencia_desde.value='${fld:ctm_fecha_vigencia_desde@dd-MM-yyyy}';
document.form1.ctm_fecha_vigencia_hasta.value='${fld:ctm_fecha_vigencia_hasta@dd-MM-yyyy}';
setComboValue('smn_planes_id','${fld:smn_planes_id}','form1');
document.form1.ctm_cantidad_afiliados.value='${fld:ctm_cantidad_afiliados@#,###,###}';
document.form1.ctm_monto_contrato.value='${fld:ctm_monto_contrato@#,###,##0.00}';
document.form1.ctm_monto_cobertura_afiliado.value='${fld:ctm_monto_cobertura_afiliado@#,###,##0.00}';
document.form1.ctm_cantidad_servicio_afiliado.value='${fld:ctm_cantidad_servicio_afiliado@#,###,###}';
document.form1.ctm_cantidad_dias_cobertura.value='${fld:ctm_cantidad_dias_cobertura@#,###,###}';
document.form1.ctm_cantidad_citas.value='${fld:ctm_cantidad_citas@#,###,###}';
setComboValue('smn_descuento_rf','${fld:smn_descuento_rf}','form1');
document.form1.ctm_dia_factura.value='${fld:ctm_dia_factura@#,###,###}';
document.form1.id.value='${fld:smn_contrato_modulo_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

