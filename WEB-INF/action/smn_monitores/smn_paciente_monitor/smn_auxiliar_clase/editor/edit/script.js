setComboValue('smn_auxiliar_id','${fld:smn_auxiliar_id}','form1');
setComboValue('smn_clase_auxiliar_id','${fld:smn_clase_auxiliar_id}','form1');
document.form1.id.value='${fld:smn_auxiliar_clase_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

