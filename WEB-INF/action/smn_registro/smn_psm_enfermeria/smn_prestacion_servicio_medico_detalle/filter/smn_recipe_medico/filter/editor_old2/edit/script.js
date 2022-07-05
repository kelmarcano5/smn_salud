document.form1.rec_fecha.value='${fld:rec_fecha@dd-MM-yyyy}';
setComboValue('smn_auxiliar_rf','${fld:smn_auxiliar_rf}','form1');
setComboValue('smn_patologia_id','${fld:smn_patologia_id}','form1');
setComboValue('smn_prestador_servicio_rf','${fld:smn_prestador_servicio_rf}','form1');
setComboValue('rec_ordenante_nombre','${fld:rec_ordenante_nombre}','form1');
setComboValue('smn_contratante_id','${fld:smn_contratante_id}','form1');
setComboValue('smn_farmaceuta_prestador_servicio_rf','${fld:smn_farmaceuta_prestador_servicio_rf}','form1');
document.form1.rec_fecha_aprobacion.value='${fld:rec_fecha_aprobacion@dd-MM-yyyy}';
setComboValue('rec_estatus','${fld:rec_estatus}','form1');
document.form1.id.value='${fld:smn_recipe_medico_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 document.form1.smn_prestacion_servicio_medico_id.value='${fld:smn_prestacion_servicio_medico_id@#,###,###}';

