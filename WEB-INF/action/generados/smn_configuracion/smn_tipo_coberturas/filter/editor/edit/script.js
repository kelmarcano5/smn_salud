document.form1.tco_codigo.value='${fld:tco_codigo@js}';
document.form1.tco_descripcion.value='${fld:tco_descripcion@js}';
document.form1.id.value='${fld:smn_tipo_coberturas_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "Editar registro";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");

