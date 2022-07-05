document.form1.smn_presupuesto_id.value='${fld:smn_presupuesto_id@#,###,###}';
setComboValue('prd_servicio','${fld:prd_servicio}','form1');
document.form1.prd_cantidad.value='${fld:prd_cantidad@#,###,###}';
document.form1.prd_monto.value='${fld:prd_monto@#,###,##0.00}';
document.form1.id.value='${fld:smn_presupuesto_detalle_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "Editar registro";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");

