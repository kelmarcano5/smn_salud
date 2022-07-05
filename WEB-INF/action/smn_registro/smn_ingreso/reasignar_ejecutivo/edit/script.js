$('#rta_ejecutivo_asignado').val('${fld:rta_ejecutivo_asignado}').change();
setComboValue('rta_ejecutivo_asignado','${fld:rta_ejecutivo_asignado}','form1');
document.form1.rta_ticket.value='${fld:rta_ticket@#######}';

 document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");

