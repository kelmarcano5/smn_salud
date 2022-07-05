document.form1.pat_codigo.value='${fld:pat_codigo@js}';
document.form1.pat_descripcion.value='${fld:pat_descripcion@js}';
setComboValue('pat_estatus','${fld:pat_estatus}','form1');
document.form1.id.value='${fld:smn_patologia_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


document.form1.pat_codigo.disabled=true;
 

