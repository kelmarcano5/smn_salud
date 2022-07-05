setComboValue('smn_tipo_servicio_rf','${fld:smn_tipo_servicio_rf}','form1');
setComboValue('nts_naturaleza','${fld:nts_naturaleza}','form1');
document.form1.id.value='${fld:smn_naturaleza_servicio_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

