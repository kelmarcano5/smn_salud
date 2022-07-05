setComboValue('rta_observacion','${fld:rta_observacion}','form1');
setComboValue('smn_estatus','${fld:smn_estatus}','form1');

document.form1.id.value='${fld:smn_ruta_id@#######}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");



 

