document.form1.mtv_codigo.value='${fld:mtv_codigo@js}';
document.form1.mtv_descripcion.value='${fld:mtv_descripcion@js}';
document.form1.id.value='${fld:smn_motivos_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


document.form1.mtv_codigo.disabled=true;
 

