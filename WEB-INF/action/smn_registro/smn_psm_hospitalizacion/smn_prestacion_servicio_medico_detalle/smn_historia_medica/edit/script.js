setComboValue('psd_estatus','${fld:psd_estatus}','form1');
setComboValue('psd_agregado_usuario','${fld:psd_agregado_usuario}','form1');
setComboValue('psd_observaciones_rf','${fld:psd_observaciones_rf}','form1');
document.form1.id.value='${fld:smn_prestacion_servicio_medico_detalle_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

