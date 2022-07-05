setComboValue('smn_sedes','${fld:smn_sedes}','form1');
setComboValue('smn_especialidad','${fld:smn_especialidad}','form1');
setComboValue('smn_prestador_servicio_especialidad','${fld:smn_prestador_servicio_especialidad}','form1');
setComboValue('smn_tipo_cita','${fld:smn_tipo_cita}','form1');
setComboValue('smn_forma_pago','${fld:smn_forma_pago}','form1');
setComboValue('smn_contratante_id','${fld:smn_contratante_id}','form1');
document.form1.smn_fecha_cita.value='${fld:smn_fecha_cita@dd-MM-yyyy}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

