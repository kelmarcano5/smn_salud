setComboValue('rta_observacion','${fld:rta_observacion}','form1');
setComboValue('smn_estatus','${fld:smn_estatus}','form1');

$('#rta_observacion').val('${fld:rta_observacion}').change();
$('#smn_estatus').val('${fld:smn_estatus}').change();

document.form1.id.value='${fld:smn_ruta_id@#######}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");



 

