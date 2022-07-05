document.form1.nfi_num_control.value='${fld:nfi_num_control@js}';
document.form1.nfi_apellidos.value='${fld:nfi_apellidos@js}';
document.form1.nfi_nombres.value='${fld:nfi_nombres@js}';
setComboValue('nfi_sexo','${fld:nfi_sexo}','form1');
document.form1.nfi_telefono_fijo.value='${fld:nfi_telefono_fijo@js}';
document.form1.nfi_telefono_movil.value='${fld:nfi_telefono_movil@js}';
document.form1.nfi_email.value='${fld:nfi_email@js}';
document.form1.id.value='${fld:smn_no_registrados_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

