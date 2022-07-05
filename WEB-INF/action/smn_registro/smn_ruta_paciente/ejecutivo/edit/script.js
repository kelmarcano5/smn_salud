setComboValue('rta_ejecutivo_asignado','${fld:rta_ejecutivo_asignado}','form1');
$('#rta_ejecutivo_asignado').val('${fld:rta_ejecutivo_asignado}').trigger('change');

document.form1.id.value='${fld:smn_ruta_id@#######}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");



 

