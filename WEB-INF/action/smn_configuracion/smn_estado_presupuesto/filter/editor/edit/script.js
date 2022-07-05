document.form1.epr_codigo.value='${fld:epr_codigo@js}';
document.form1.epr_descripcion.value='${fld:epr_descripcion@js}';
document.form1.id.value='${fld:smn_estado_presupuesto_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


document.form1.epr_codigo.disabled=true;
 

