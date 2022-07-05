document.form1.sri_codigo.value='${fld:sri_codigo@js}';
document.form1.sri_nombre.value='${fld:sri_nombre@js}';
setComboValue('sri_estatus','${fld:sri_estatus}','form1');
document.form1.sri_ultimo_numero.value='${fld:sri_ultimo_numero}';
setComboValue('sri_reinicio','${fld:sri_reinicio}','form1');
setComboValue('sri_paciente_nuevo','${fld:sri_paciente_nuevo}','form1');
setComboValue('smn_contratante_id','${fld:smn_contratante_id}','form1');
setComboValue('sri_particular','${fld:sri_particular}','form1');
document.form1.id.value='${fld:smn_series_id}';

document.getElementById("formTitle").innerHTML = "Editar registro";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");
// <rows>setCheckboxValue('smn_unidades_servicios_id','${fld:smn_unidades_servicios_id}','form1');</rows>

