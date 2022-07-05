setComboValue('smn_areas_servicios_rf','${fld:smn_areas_servicios_rf}','form1');
setComboValue('smn_unidad_servicio_rf','${fld:smn_unidad_servicio_rf}','form1');
document.form1.cap_cant_max_pacientes.value='${fld:cap_cant_max_pacientes@#,###,###}';
document.form1.cap_cant_min_pacientes.value='${fld:cap_cant_min_pacientes@#,###,###}';
document.form1.id.value='${fld:smn_capacidades_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

