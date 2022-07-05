document.form1.loc_codigo.value='${fld:loc_codigo@js}';
document.form1.loc_descripcion.value='${fld:loc_descripcion@js}';
setComboValue('loc_status','${fld:loc_status}','form1');
document.form1.id.value='${fld:smn_localidad_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


document.form1.loc_codigo.disabled=true;
 

