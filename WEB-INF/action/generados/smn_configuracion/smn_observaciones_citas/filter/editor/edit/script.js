document.form1.obc_codigo.value='${fld:obc_codigo@js}';
document.form1.obc_descripcion.value='${fld:obc_descripcion@js}';
document.form1.id.value='${fld:smn_observaciones_citas_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "Editar registro";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");

