setComboValue('smn_documento_id','${fld:smn_documento_id}','form1');
setComboValue('cts_clase_auxiliar','${fld:cts_clase_auxiliar}','form1');
setComboValue('cts_auxiliar','${fld:cts_auxiliar}','form1');
setComboValue('smn_condicion_financiera_rf','${fld:smn_condicion_financiera_rf}','form1');
setComboValue('smn_contratante_id','${fld:smn_contratante_id}','form1');
setComboValue('smn_observaciones_id','${fld:smn_observaciones_id}','form1');
document.form1.id.value='${fld:smn_citas_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

