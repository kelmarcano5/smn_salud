document.form1.put_codigo.value='${fld:put_codigo@js}';
document.form1.put_descripcion.value='${fld:put_descripcion@js}';
setComboValue('put_estatus','${fld:put_estatus}','form1');
document.form1.id.value='${fld:smn_puesto_atencion_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


document.form1.put_codigo.disabled=true;
 

