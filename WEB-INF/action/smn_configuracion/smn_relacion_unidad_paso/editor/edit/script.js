var area = '${fld:smn_area_servicio_rf}';
$('#smn_area_servicio_rf').val(area).change();

//var uni = '${fld:smn_unidad_servicio_rf}';
//$('#smn_unidad_servicio_rf').val(uni).change();

var paso = '${fld:smn_paso_rf}';
$('#smn_paso_rf').val(paso).change();

var serie = '${fld:smn_serie_id}';
$('#smn_serie_id').val(serie).change();

var unit = '${fld:rup_unidad_administrativa}';
$('#rup_unidad_administrativa').val(unit).change();

var est = '${fld:rup_estatus}';
$('#rup_estatus').val(est).change();

setComboValue('smn_area_servicio_rf','${fld:smn_area_servicio_rf}','form1');
setComboValue('smn_unidad_servicio_rf','${fld:smn_unidad_servicio_rf}','form1');
setComboValue('smn_paso_rf','${fld:smn_paso_rf}','form1');
setComboValue('smn_serie_id','${fld:smn_serie_id}','form1');
document.form1.rup_secuencia.value='${fld:rup_secuencia@#,###,###}';
setComboValue('rup_unidad_administrativa','${fld:rup_unidad_administrativa}','form1');
setComboValue('rup_estatus','${fld:rup_estatus}','form1');
document.form1.rup_vigencia.value='${fld:rup_vigencia@dd-MM-yyyy}';
document.form1.id.value='${fld:smn_rel_unidad_paso@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

