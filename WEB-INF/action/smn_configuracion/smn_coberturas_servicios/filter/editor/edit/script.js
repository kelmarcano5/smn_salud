setComboValue('smn_coberturas_id','${fld:smn_coberturas_id}','form1');
setComboValue('smn_unidades_servicios_id','${fld:smn_unidades_servicios_id}','form1');
document.form1.id.value='${fld:smn_coberturas_servicios_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "Editar registro";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");

