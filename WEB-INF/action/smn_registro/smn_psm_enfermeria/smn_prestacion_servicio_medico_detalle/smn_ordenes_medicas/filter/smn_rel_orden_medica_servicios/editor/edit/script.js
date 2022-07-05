document.form1.smn_ordenes_medicas_id.value='${fld:smn_ordenes_medicas_id@#,###,###}';
setComboValue('smn_servicios_rf','${fld:smn_servicios_rf}','form1');
document.form1.ros_observacion.value='${fld:ros_observacion@js}';
setComboValue('smn_grupo_prestador_servicio_rf','${fld:smn_grupo_prestador_servicio_rf}','form1');
setComboValue('smn_prestador_servicio_rf','${fld:smn_prestador_servicio_rf}','form1');
document.form1.id.value='${fld:smn_rel_orden_medica_servicios_id@#######}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

