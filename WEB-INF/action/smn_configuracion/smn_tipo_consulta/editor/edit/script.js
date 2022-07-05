document.form1.tcs_codigo.value='${fld:tcs_codigo@js}';
document.form1.tcs_nombre.value='${fld:tcs_nombre@js}';
document.form1.id.value='${fld:smn_tipo_consulta_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


document.form1.tcs_codigo.disabled=true;
 

