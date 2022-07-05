var doc = '${fld:smn_documentos_id}';
$('#smn_documentos_id').val(doc).change();

var se = '${fld:smn_servicios_id}';
$('#smn_servicios_id').val(se).change();

var tp = '${fld:rdt_tipo_generacion}';
$('#rdt_tipo_generacion').val(tp).change();


setComboValue('smn_documentos_id','${fld:smn_documentos_id}','form1');
setComboValue('smn_servicios_id','${fld:smn_servicios_id}','form1');
setComboValue('rdt_tipo_generacion','${fld:rdt_tipo_generacion}','form1');
document.form1.rdt_hora_generacion.value='${fld:rdt_hora_generacion@js}';
document.form1.id.value='${fld:smn_rel_documentos_servicios_id@#######}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

