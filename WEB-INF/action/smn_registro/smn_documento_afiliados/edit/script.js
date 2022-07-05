setComboValue('smn_tipo_documento_afiliado_id','${fld:smn_tipo_documento_afiliado_id}','form1');
setComboValue('smn_afiliados_id','${fld:smn_afiliados_id}','form1');
document.form1.doc_archivo.value='${fld:doc_archivo@js}';
document.form1.doc_descripcion.value='${fld:doc_descripcion@js}';
document.form1.id.value='${fld:smn_documento_afiliados_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "Editar registro";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");

