
setComboValue('smn_entidades_rf','${fld:smn_entidades_rf}','form1');
setComboValue('smn_sucursales_rf','${fld:smn_sucursales_rf}','form1');
document.form1.cts_numero_ticket.value='${fld:cts_numero_ticket@#,###,###}';
setComboValue('smn_origen_id','${fld:smn_origen_id}','form1');
setComboValue('cts_clase_auxiliar','${fld:cts_clase_auxiliar}','form1');
setComboValue('cts_auxiliar','${fld:cts_auxiliar}','form1');
setComboValue('smn_condicion_financiera_rf','${fld:smn_condicion_financiera_rf}','form1');
setComboValue('smn_contratante_id','${fld:smn_contratante_id}','form1');
setComboValue('smn_observaciones_id','${fld:smn_observaciones_id}','form1');
setComboValue('smn_estatus_citas_id','${fld:smn_estatus_citas_id}','form1');
document.form1.id.value='${fld:smn_citas_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

