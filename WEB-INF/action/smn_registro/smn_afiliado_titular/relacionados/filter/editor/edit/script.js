setComboValue('smn_afiliados_id','${fld:smn_afiliados_id}','form1');
setComboValue('smn_documento_id','${fld:smn_documento_id}','form1');
document.form1.rel_numero_control.value='${fld:rel_numero_control@#,###,###}';
setComboValue('smn_clase_rf','${fld:smn_clase_rf}','form1');
setComboValue('smn_auxiliar_rf','${fld:smn_auxiliar_rf}','form1');
setComboValue('smn_parentesco_rf','${fld:smn_parentesco_rf}','form1');
document.form1.smn_numero_hijo.value='${fld:smn_numero_hijo@#,###,###}';
document.form1.id.value='${fld:smn_relacionado_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

