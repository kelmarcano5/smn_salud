document.form1.dgn_codigo.value='${fld:dgn_codigo@js}';
document.form1.dgn_descripcion.value='${fld:dgn_descripcion@js}';
setComboValue('dgn_tipo','${fld:dgn_tipo}','form1');
document.form1.id.value='${fld:smn_diagnostico_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "Editar registro";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");

