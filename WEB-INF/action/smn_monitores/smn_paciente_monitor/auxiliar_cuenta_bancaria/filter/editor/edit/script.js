setComboValue('smn_clase_auxiliar_rf','${fld:smn_clase_auxiliar_rf}','form1');
setComboValue('smn_auxiliar_rf','${fld:smn_auxiliar_rf}','form1');
document.form1.acb_num_cuenta.value='${fld:acb_num_cuenta@js}';
setComboValue('acb_tipo_cta_banco','${fld:acb_tipo_cta_banco}','form1');
document.form1.acb_respons_cuenta.value='${fld:acb_respons_cuenta@js}';
setComboValue('acb_banco_pertenece','${fld:acb_banco_pertenece}','form1');
document.form1.acb_num_aba.value='${fld:acb_num_aba@js}';
document.form1.id.value='${fld:smn_auxiliar_cuenta_bancaria_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

document.getElementById('smn_clase_auxiliar_rf').disabled=true;
document.getElementById('smn_auxiliar_rf').disabled=true;