var smn_servicio_rf = '${fld:smn_servicio_rf}';
$('#smn_servicio_rf').val(smn_servicio_rf).change();

setComboValue('smn_patologia_id','${fld:smn_patologia_id}','form1');
setComboValue('smn_servicio_rf','${fld:smn_servicio_rf}','form1');
document.form1.rps_cantidad.value='${fld:rps_cantidad@#,###,###}';
document.form1.id.value='${fld:smn_rel_patologia_servicios_id@#######}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

