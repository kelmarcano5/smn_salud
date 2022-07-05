document.form1.tdo_codigo.value='${fld:tdo_codigo@js}';
document.form1.tdo_descripcion.value='${fld:tdo_descripcion@js}';
document.form1.id.value='${fld:smn_tipo_documento_afiliado_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "Editar registro";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");

