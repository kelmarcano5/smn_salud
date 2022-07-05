document.form1.acc_codigo.value='${fld:acc_codigo@js}';
document.form1.acc_descripcion.value='${fld:acc_descripcion@js}';
document.form1.id.value='${fld:smn_acciones_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


document.form1.acc_codigo.disabled=true;
 

