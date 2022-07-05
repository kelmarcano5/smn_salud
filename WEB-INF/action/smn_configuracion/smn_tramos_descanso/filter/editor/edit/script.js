setComboValue('smn_tramos_id','${fld:smn_tramos_id}','form1');
document.form1.trd_hora_descanso_desde.value='${fld:trd_hora_descanso_desde@js}';
document.form1.trd_hora_descanso_hasta.value='${fld:trd_hora_descanso_hasta@js}';
document.form1.id.value='${fld:smn_tramo_descanso_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

