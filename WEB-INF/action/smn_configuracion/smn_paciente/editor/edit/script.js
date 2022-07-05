setComboValue('smn_clase_auxiliar_rf','${fld:smn_clase_auxiliar_rf}','form1');
setComboValue('smn_auxiliar_rf','${fld:smn_auxiliar_rf}','form1');
setComboValue('smn_clasificacion_abc_rf','${fld:smn_clasificacion_abc_rf}','form1');
document.form1.pac_vigencia.value='${fld:pac_vigencia@dd-MM-yyyy}';
setComboValue('pac_estatus','${fld:pac_estatus}','form1');
setComboValue('smn_forma_pago_rf','${fld:smn_forma_pago_rf}','form1');
setComboValue('smn_condicion_financiera_rf','${fld:smn_condicion_financiera_rf}','form1');
setComboValue('smn_promotor_rf','${fld:smn_promotor_rf}','form1');
document.form1.id.value='${fld:smn_paciente_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

