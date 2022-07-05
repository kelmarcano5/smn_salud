setComboValue('smn_tipo_documento_id','${fld:smn_tipo_documento_id}','form1');
setComboValue('smn_patologia_id','${fld:smn_patologia_id}','form1');
document.form1.id.value='${fld:smn_rel_tipodoc_patologia_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "Editar registro";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");

