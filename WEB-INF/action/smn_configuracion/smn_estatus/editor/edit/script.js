document.form1.sta_codigo.value='${fld:sta_codigo@js}';
document.form1.sta_descripcion.value='${fld:sta_descripcion@js}';
document.form1.sta_cod_siguiente.value='${fld:sta_cod_siguiente@js}';
document.form1.id.value='${fld:smn_estatus_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


document.form1.sta_codigo.disabled=true;
 

