document.form1.obs_codigo.value='${fld:obs_codigo@js}';
document.form1.obs_descripcion.value='${fld:obs_descripcion@js}';
setComboValue('obs_tipo','${fld:obs_tipo}','form1');
document.form1.id.value='${fld:smn_observaciones_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "Editar registro";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");

