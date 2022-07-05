document.form1.tco_codigo.value='${fld:tco_codigo@js}';
document.form1.tco_descripcion.value='${fld:tco_descripcion@js}';
document.form1.id.value='${fld:smn_tipo_coberturas_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


document.form1.tco_codigo.disabled=true;
 

