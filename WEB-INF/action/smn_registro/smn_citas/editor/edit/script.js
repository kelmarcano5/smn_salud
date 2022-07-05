var smn_documento_id = '${fld:smn_documento_id}';
if (smn_documento_id == '' || smn_documento_id == 0)  {

}else{
	$('#smn_documento_id').val(smn_documento_id).change();
}

var cts_clase_auxiliar = '${fld:cts_clase_auxiliar}';
if (cts_clase_auxiliar == '' || cts_clase_auxiliar == 0)  {

}else{
	$('#cts_clase_auxiliar').val(cts_clase_auxiliar).change();
}

var cts_auxiliar = '${fld:cts_auxiliar}';
if (cts_auxiliar == '' || cts_auxiliar == 0)  {

}else{
	$('#cts_auxiliar').val(cts_auxiliar).change();
}

var smn_condicion_financiera_rf = '${fld:smn_condicion_financiera_rf}';
if (smn_condicion_financiera_rf == '' || smn_condicion_financiera_rf == 0)  {

}else{
	$('#smn_condicion_financiera_rf').val(smn_condicion_financiera_rf).change();
}

var smn_contratante_id = '${fld:smn_contratante_id}';
if (smn_contratante_id == '' || smn_contratante_id == 0)  {

}else{
	$('#smn_contratante_id').val(smn_contratante_id).change();
}

var smn_observaciones_id = '${fld:smn_observaciones_id}';
if (smn_observaciones_id == '' || smn_observaciones_id == 0)  {

}else{
	$('#smn_observaciones_id').val(smn_observaciones_id).change();
}

setComboValue('smn_documento_id','${fld:smn_documento_id}','form1');
setComboValue('cts_clase_auxiliar','${fld:cts_clase_auxiliar}','form1');
setComboValue('cts_auxiliar','${fld:cts_auxiliar}','form1');
setComboValue('smn_condicion_financiera_rf','${fld:smn_condicion_financiera_rf}','form1');
setComboValue('smn_contratante_id','${fld:smn_contratante_id}','form1');
setComboValue('smn_observaciones_id','${fld:smn_observaciones_id}','form1');
document.form1.id.value='${fld:smn_citas_id@#######}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

