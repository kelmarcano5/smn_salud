document.form1.mac_codigo.value='${fld:mac_codigo@#,###,###}';
document.form1.mac_descripcion.value='${fld:mac_descripcion@#,###,###}';
document.form1.id.value='${fld:smn_marca_comercial_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "Editar registro";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");

