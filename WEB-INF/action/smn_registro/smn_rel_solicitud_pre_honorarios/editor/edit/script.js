document.form1.smn_solicitud_presupuesto_id.value='${fld:smn_solicitud_presupuesto_id@#,###,###}';
setComboValue('smn_servicios_rf','${fld:smn_servicios_rf}','form1');
setComboValue('smn_componentes_rf','${fld:smn_componentes_rf}','form1');
setComboValue('smn_grupo_prestador_servicio_rf','${fld:smn_grupo_prestador_servicio_rf}','form1');
setComboValue('smn_prestador_serviciorf','${fld:smn_prestador_serviciorf}','form1');
document.form1.rsh_monto_solicitado_ml.value='${fld:rsh_monto_solicitado_ml@#,###,##0.00}';
document.form1.rsh_monto_solicitado_ma.value='${fld:rsh_monto_solicitado_ma@#,###,##0.00}';
setComboValue('smn_tasa_id','${fld:smn_tasa_id}','form1');
setComboValue('smn_moneda_id','${fld:smn_moneda_id}','form1');
document.form1.id.value='${fld:smn_rel_solicitud_pre_honorarios_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

