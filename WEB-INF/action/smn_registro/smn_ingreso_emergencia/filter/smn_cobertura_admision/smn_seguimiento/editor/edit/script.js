var ac = '${fld:seg_accion}';
$('#seg_accion').val(ac).change();


document.form1.smn_ingreso_id.value='${fld:smn_ingreso_id@#######}';
document.form1.seg_fecha.value='${fld:seg_fecha@dd-MM-yyyy}';
document.form1.seg_hora_seg.value='${fld:seg_hora_seg@js}';
//document.form1.seg_accion.value='${fld:seg_accion@js}';
document.form1.seg_observacion.value='${fld:seg_observacion@js}';
setComboValue('seg_estatus','${fld:seg_estatus}','form1');
document.form1.id.value='${fld:smn_seguimiento_id@#######}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

