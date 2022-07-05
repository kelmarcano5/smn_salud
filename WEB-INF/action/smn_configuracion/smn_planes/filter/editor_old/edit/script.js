document.form1.pla_codigo.value='${fld:pla_codigo@js}';
document.form1.pla_descripcion.value='${fld:pla_descripcion@js}';
document.form1.pla_vigencia_desde.value='${fld:pla_vigencia_desde@dd-MM-yyyy}';
document.form1.pla_vigencia_hasta.value='${fld:pla_vigencia_hasta@dd-MM-yyyy}';
setComboValue('pla_inactivo','${fld:pla_inactivo}','form1');
setComboValue('pla_modelo_contrato','${fld:pla_modelo_contrato}','form1');
setComboValue('pla_empresa','${fld:pla_empresa}','form1');
document.form1.id.value='${fld:smn_planes_id}';
 
document.getElementById("formTitle").innerHTML = "Editar registro";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");
<rows>setCheckboxValue('smn_contrato_modulo_id','${fld:smn_contrato_modulo_id}','form1');</rows>

