var numing = '${fld:igs_num_ingreso@#######}';
if (numing != 0) {
	$('#numingreso').show();
	document.getElementById("igs_num_ingreso").disabled=true;
} else {
	$('#numingreso').hide();
}

var doc = '${fld:smn_documento_id}';
if (doc == 0 || doc == '') {
   
} else {
    $('#smn_documento_id').val(doc).change();
}

var cont = '${fld:smn_contratante_id}';
$('#smn_contratante_id').val(cont).change();

var aux = '${fld:smn_auxiliar_rf}';
if (aux == 0 || aux == '') {
   
} else {
    $('#cts_auxiliar').val(aux).change();
   // getPresupuesto('${fld:smn_auxiliar_rf}');
}

var clase = '${fld:smn_clase_rf}';
$('#cts_clase_auxiliar').val(clase).change();

var doc_orig = '${fld:smn_doc_orig}';
if (doc_orig == 0 || doc_orig == '') {
   getPresupuesto(doc_orig);
} else {
    $('#smn_doc_orig').val(doc_orig).change();

}

var acti = '${fld:smn_activo_fijo}';
if (acti == 0 || acti == '') {
  $('#smn_activo_fijo_rf').val(0).change();
} else {
    $('#smn_activo_fijo_rf').val(acti).change();
    $('#smn_activo_fijo_rf').prop("disabled", "true");

}

var enti = '${fld:smn_entidades_rf}';
$('#smn_entidades_rf').val(enti).change();

var suc = '${fld:smn_sucursales_rf}';
$('#smn_sucursales_rf').val(suc).change();

var area = '${fld:smn_areas_servicios_rf}';
$('#smn_areas_servicios_rf').val(area).change();

var uni = '${fld:smn_unidades_servicios_rf}';
$('#smn_unidades_servicios_rf').val(uni).change();

var moti = '${fld:smn_motivos_id}';
$('#smn_motivos_id').val(moti).change();

var sint = '${fld:smn_sintoma_id}';
$('#smn_sintoma_id').val(sint).change();

var pato = '${fld:smn_patologia_id}';
$('#smn_patologia_id').val(pato).change();

var pres = '${fld:smn_prestador_servicio_rf}';
$('#smn_prestador_servicio_rf').val(pres).change();

var numero = '${fld:igs_numero_autorizacion}';
$('#igs_numero_autorizacion').val(numero);

var moneda = '${fld:smn_moneda_rf}';
$('#smn_moneda_rf').val(moneda);

//document.form1.smn_doc_orig.value='${fld:smn_doc_orig@#,###,###}';
//setComboValue('smn_documento_id','${fld:smn_documento_id}','form1');
document.form1.igs_doc_origen.value='${fld:igs_doc_origen@#######}';
document.form1.igs_num_ingreso.value='${fld:igs_num_ingreso@#######}';
//setComboValue('smn_entidades_rf','${fld:smn_entidades_rf}','form1');
//setComboValue('smn_sucursales_rf','${fld:smn_sucursales_rf}','form1');
//setComboValue('smn_areas_servicios_rf','${fld:smn_areas_servicios_rf}','form1');
//setComboValue('smn_unidades_servicios_rf','${fld:smn_unidades_servicios_rf}','form1');
document.form1.ctm_observaciones_id.value='${fld:ctm_observaciones_id@js}';
//document.form1.igs_ticket.value='${fld:igs_ticket@#,###,###}';
//document.form1.smn_clase_rf.value='${fld:smn_clase_rf@#,###,###}';
//document.form1.smn_auxiliar_rf.value='${fld:smn_auxiliar_rf@#,###,###}';
//setComboValue('smn_contratante_id','${fld:smn_contratante_id}','form1');
document.form1.smn_auxiliar_sucursales_rf.value='${fld:smn_auxiliar_sucursales_rf@#,###,###}';
document.form1.smn_auxiliar_areas_servicios_rf.value='${fld:smn_auxiliar_areas_servicios_rf@#,###,###}';
document.form1.smn_auxilia_unidad_servicio_rf.value='${fld:smn_auxilia_unidad_servicio_rf@#,###,###}';
//setComboValue('smn_motivos_id','${fld:smn_motivos_id}','form1');
document.form1.smn_observaciones_ingresos_id.value='${fld:smn_observaciones_ingresos_id@#,###,###}';
document.form1.igs_monto_moneda_local.value='${fld:igs_monto_moneda_local@#######0.00}';
//document.form1.smn_moneda_rf.value='${fld:smn_moneda_rf@#,###,###}';
document.form1.igs_monto_moneda_alterna.value=formatear_monto('${fld:igs_monto_moneda_alterna@##,###,###0.00}');
setComboValue('smn_sintoma_id','${fld:smn_sintoma_id}','form1');
//document.form1.igs_estatus_financiero.value='${fld:igs_estatus_financiero@js}';
setComboValue('igs_estatus_financiero','${fld:igs_estatus_financiero}','form1');
document.form1.id.value='${fld:smn_ingresos_id@#######}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


setComboValue('cts_auxiliar','${fld:cts_auxiliar}','form1');
setComboValue('cts_clase_auxiliar','${fld:cts_clase_auxiliar}','form1');
//setComboValue('smn_activo_fijo_rf','${fld:smn_activo_fijo_rf}','form1');

//document.form1.igs_numero_autorizacion.value='${fld:igs_numero_autorizacion@#######}';
document.form1.igs_dias_hospitalizacion.value='${fld:igs_dias_hospitalizacion@#######}';
document.form1.igs_monto_cobertura.value='${fld:igs_monto_cobertura@#,###,###}';

 document.form1.igs_fecha_ingreso.value='${fld:igs_fecha_ingreso@dd-MM-yyyy}';
 document.form1.igs_fecha_salida.value='${fld:igs_fecha_salida@dd-MM-yyyy}';

function formatear_monto(monto){
    var base = monto;
    base1 = base.replace('.','');
    base = base1.replace('.','');
    base1 = base.replace(',','.');
    
    return base1;
}