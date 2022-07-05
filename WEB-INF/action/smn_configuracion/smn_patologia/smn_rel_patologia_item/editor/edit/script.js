var smn_item_rf = '${fld:smn_item_rf}';
$('#smn_item_rf').val(smn_item_rf).change();

setComboValue('smn_patologia_id','${fld:smn_patologia_id}','form1');
setComboValue('smn_item_rf','${fld:smn_item_rf}','form1');
document.form1.rps_cantidad.value='${fld:rps_cantidad@#,###,###}';
document.form1.id.value='${fld:smn_rel_patologia_item_id@#######}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

