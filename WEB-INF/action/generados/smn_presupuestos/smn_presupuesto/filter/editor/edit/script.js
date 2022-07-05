document.form1.pre_numero_control.value='${fld:pre_numero_control@js}';
document.form1.pre_fecha.value='${fld:pre_fecha@dd-MM-yyyy}';
setComboValue('pre_titular','${fld:pre_titular}','form1');
setComboValue('pre_beneficiario','${fld:pre_beneficiario}','form1');
setComboValue('pre_plan','${fld:pre_plan}','form1');
setComboValue('pre_clase_auxiliar','${fld:pre_clase_auxiliar}','form1');
setComboValue('pre_auxiliar','${fld:pre_auxiliar}','form1');
document.form1.pre_vigencia_hasta.value='${fld:pre_vigencia_hasta@dd-MM-yyyy}';
setComboValue('smn_ordenes_medicas_id','${fld:smn_ordenes_medicas_id}','form1');
setComboValue('smn_estado_presupuesto_id','${fld:smn_estado_presupuesto_id}','form1');
document.form1.id.value='${fld:smn_presupuesto_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "Editar registro";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");

