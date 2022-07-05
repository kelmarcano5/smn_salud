document.form1.ori_codigo.value='${fld:ori_codigo@js}';
document.form1.ori_descripcion.value='${fld:ori_descripcion@js}';
setComboValue('ori_tipo','${fld:ori_tipo}','form1');
document.form1.id.value='${fld:smn_origen_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "Editar registro";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");

