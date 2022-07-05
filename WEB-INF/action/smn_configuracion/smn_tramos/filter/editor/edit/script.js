document.form1.trm_codigo.value='${fld:trm_codigo@js}';
document.form1.trm_descripcion.value='${fld:trm_descripcion@js}';
setComboValue('trm_dia_semana','${fld:trm_dia_semana}','form1');
document.form1.trm_hora_inicio.value='${fld:trm_hora_inicio@js}';
document.form1.trm_hora_fin.value='${fld:trm_hora_fin@js}';
document.form1.id.value='${fld:smn_tramos_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


document.form1.trm_codigo.disabled=true;
 

