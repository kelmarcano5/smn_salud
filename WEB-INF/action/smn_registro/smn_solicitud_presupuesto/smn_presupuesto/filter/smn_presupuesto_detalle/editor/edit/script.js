setComboValue('smn_presupuesto_id','${fld:smn_presupuesto_id}','form1');
setComboValue('smn_tipo_componentes_rf','${fld:smn_tipo_componentes_rf}','form1');
setComboValue('smn_componentes_rf','${fld:smn_componentes_rf}','form1');
setComboValue('smn_moneda_rf','${fld:smn_moneda_rf}','form1');
setComboValue('smn_tasa_rf','${fld:smn_tasa_rf}','form1');
document.form1.prd_cantidad.value='${fld:prd_cantidad@#,###,##0.00}';
document.form1.prd_precio.value='${fld:prd_precio@#,###,##0.00}';
document.form1.prd_precio_ma.value='${fld:prd_precio_ma@#,###,##0.00}';
document.form1.prd_monto_moneda_local.value='${fld:prd_monto_moneda_local@#,###,##0.00}';
// document.form1.prd_monto_moneda_local2.value='${fld:prd_monto_moneda_local@#,###,##0.00}';
document.form1.prd_moneda_alterna.value='${fld:prd_moneda_alterna@#,###,##0.00}';
document.form1.prd_monto_incremento_ml.value='${fld:prd_monto_incremento_ml@#,###,##0.00}';
document.form1.prd_monto_incremento_ma.value='${fld:prd_monto_incremento_ma@#,###,##0.00}';
document.form1.prd_monto_descuento_ml.value='${fld:prd_monto_descuento_ml@#,###,##0.00}';
document.form1.prd_monto_descuento_ma.value='${fld:prd_monto_descuento_ma@#,###,##0.00}';
document.form1.prd_monto_neto_ml.value='${fld:prd_monto_neto_ml@#,###,##0.00}';
document.form1.prd_monto_neto_ma.value='${fld:prd_monto_neto_ma@#,###,##0.00}';

setComboValue('prd_naturaleza','${fld:prd_naturaleza}','form1');
setComboValue('smn_incrementos_rf','${fld:smn_incrementos_rf}','form1');
setComboValue('smn_codigo_descuento_rf','${fld:smn_codigo_descuento_rf}','form1');

setComboValue('prd_estatus','${fld:prd_estatus}','form1');
document.form1.prd_observaciones.value='${fld:prd_observaciones@js}';
document.form1.id.value='${fld:smn_presupuesto_detalle_id@#######}';

document.getElementById('prd_moneda_alterna').disabled=true;
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");

document.getElementById('precio_ma').style.display='none';
document.getElementById('monto_ma').style.display='none';

var nat = '${fld:prd_naturaleza}';
var item = '${fld:smn_item_rf}';
var ser = '${fld:smn_servicios_rf}';
console.log(item);

var tasa = '${fld:smn_tasa_rf}';
var montomonedaalt = '${fld:prd_moneda_alterna@#,###,##0.00}';
var montodesml = '${fld:prd_monto_descuento_ml@#,###,##0.00}';
var montonetml = '${fld:prd_monto_neto_ml@#,###,##0.00}';
var montodesma = '${fld:prd_monto_descuento_ma@#,###,##0.00}';
var montonetma = '${fld:prd_monto_neto_ma@#,###,##0.00}';
var montoincml = '${fld:prd_monto_incremento_ml@#,###,##0.00}';
var montoincma = '${fld:prd_monto_incremento_ma@#,###,##0.00}';

function formatear_monto(monto){
	var base = monto;
	base1 = base.replace('.','');
	base = base1.replace('.','');
	base1 = base.replace(',','.');
	
	return base1;
}

if (nat == 'IT' ) {
	$("#smn_item_rf option[value='0']").remove();
	setComboValue('smn_item_rf','${fld:smn_item_rf}','form1');
	$('#prd_naturaleza').val(nat).change();
	$('#item').show();
	//$('#smn_item_rf').val(item).trigger('change');
	$('#servicio').hide();
}else{
	$('#item').hide();
}

if (nat == 'SE' ) {
	$("#smn_servicios_rf option[value='0']").remove();
	setComboValue('smn_servicios_rf','${fld:smn_servicios_rf}','form1');
	$('#prd_naturaleza').val(nat).change();
	$('#servicio').show();
	//$('#smn_servicios_rf').val(ser).trigger('change');;
	$('#item').hide();
}else{
	$('#servicio').hide();
}

var smn_tipo_componentes_rf = '${fld:smn_tipo_componentes_rf}';
$('#smn_tipo_componentes_rf').val(smn_tipo_componentes_rf).change();

if (moneda_alterna=='SI') {
	$('#moneda').show();
	$('#tasa').show();

	var smn_moneda_rf = '${fld:smn_moneda_rf}';
	if (smn_moneda_rf == null || smn_moneda_rf == '') {

	}else{
		$('#smn_moneda_rf').val(smn_moneda_rf).change();
		setComboValue('smn_moneda_rf','${fld:smn_moneda_rf}','form1');
	}

	var smn_tasa_rf = '${fld:smn_tasa_rf}';
	if (smn_tasa_rf == null || smn_tasa_rf == '') {

	}else{
		$('#smn_tasa_rf').val(smn_tasa_rf).change();

	}
	
}else{
	$('#moneda').hide();
	$('#tasa').hide();
}


var smn_incrementos_rf = '${fld:smn_incrementos_rf}';
if (smn_incrementos_rf == null || smn_incrementos_rf == '' || smn_incrementos_rf == 0) {

}else{
	$('#smn_incrementos_rf').val(smn_incrementos_rf).change();
}

var smn_codigo_descuento_rf = '${fld:smn_codigo_descuento_rf}';
if (smn_codigo_descuento_rf == null || smn_codigo_descuento_rf == '' || smn_codigo_descuento_rf == 0) {

}else{
	$('#smn_codigo_descuento_rf').val(smn_codigo_descuento_rf).change();

}

if (tasa != 0) {
	document.getElementById('tasa').style.display='';
}else{
	document.getElementById('tasa').style.display='none';
}

if(montomonedaalt != 0) {
	document.getElementById('monto_ma').style.display='';
	document.getElementById('prd_moneda_alterna').disabled=true;
}else{
	document.getElementById('monto_ma').style.display='none';
	document.getElementById('prd_moneda_alterna').disabled=true;
}

if(montodesml != 0){
	document.getElementById('montodesml').style.display='';
	document.getElementById('prd_monto_descuento_ml').disabled=true;
}else{
	document.getElementById('montodesml').style.display='';
	document.getElementById('prd_monto_descuento_ml').value=0;
	document.getElementById('prd_monto_descuento_ml').disabled=true;
}

if(montonetml != 0){
	document.getElementById('montonetml').style.display='';
	document.getElementById('prd_monto_neto_ml').disabled=true;
}else{
	document.getElementById('montonetml').style.display='';
	document.getElementById('prd_monto_neto_ml').value=0;
	document.getElementById('prd_monto_neto_ml').disabled=true;
}

if(montoincml != 0) {
	document.getElementById('montoincml').style.display='';
	document.getElementById('prd_monto_incremento_ml').disabled=true;
}else{
	document.getElementById('montoincml').style.display='';
	//document.getElementById('montoincml').style.display='none';
	document.getElementById('prd_monto_incremento_ml').value=0;
	document.getElementById('prd_monto_incremento_ml').disabled=true;
}

if(montodesma != 0) {
	document.getElementById('montodesma').style.display='';
	document.getElementById('prd_monto_descuento_ma').disabled=true;
}else{
	document.getElementById('montodesma').style.display='none';
	document.getElementById('prd_monto_descuento_ma').value=0;
	document.getElementById('prd_monto_descuento_ma').disabled=true;
}

if(montonetma != 0){
	document.getElementById('montonetma').style.display='';
	document.getElementById('prd_monto_neto_ma').disabled=true;
}else{
	document.getElementById('montonetma').style.display='none';
	document.getElementById('prd_monto_neto_ma').value=0;
	document.getElementById('prd_monto_neto_ma').disabled=true;
}

if(montoincma != 0) {
	document.getElementById('montoincma').style.display='';
	document.getElementById('prd_monto_incremento_ma').disabled=true;
}else{
	document.getElementById('montoincma').style.display='none';
//	document.getElementById('montoincma').style.display='none';
	document.getElementById('prd_monto_incremento_ma').value=0;
	document.getElementById('prd_monto_incremento_ma').disabled=true;
}


 

