document.form1.smn_control_quirofano_id.value='${fld:smn_control_quirofano_id@#,###,###}';
setComboValue('smn_servicios_rf','${fld:smn_servicios_rf}','form1');
setComboValue('smn_componente_rf','${fld:smn_componente_rf}','form1');
setComboValue('smn_grupo_prestador_servicio_rf','${fld:smn_grupo_prestador_servicio_rf}','form1');
setComboValue('smn_prestador_servicio_rf','${fld:smn_prestador_servicio_rf}','form1');
document.form1.id.value='${fld:smn_rel_control_quirofano_prestador_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

