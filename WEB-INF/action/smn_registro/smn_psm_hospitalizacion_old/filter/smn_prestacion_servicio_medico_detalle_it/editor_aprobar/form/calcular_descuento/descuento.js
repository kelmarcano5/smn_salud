// listboxClear("smn_descuento_ml_rf");

// var optionChoose = document.createElement("option");
// optionChoose.text = '[${lbl:b_choose}]';
// optionChoose.value = "";
// document.form1.smn_descuento_ml_rf.add(optionChoose, 0);

// <smn_descuento_ml_rf_rows>
// 	var option = document.createElement("option");
// 	option.text = "${fld:item@js}"; 
// 	option.value = "${fld:id}";
// 	document.form1.smn_descuento_ml_rf.add(option, 0);
// </smn_descuento_ml_rf_rows>
var descuento_monto = document.getElementById('psd_monto_descuento_propuesto_ml').value;
var descuento_neto_monto = document.getElementById('psd_monto_neto_propuesto_ml').value;
var monto = document.getElementById('psd_monto_propuesto_ml').value;
var div = 100;
var resultado = "";
var resultado2 = "";
//alert(monto);
var porce = '${fld:porcentaje}';

resultado = (monto * porce) / div;
resultado2 = monto - porce;

document.getElementById("psd_monto_descuento_propuesto_ml").value = resultado;
document.getElementById("psd_monto_neto_propuesto_ml").value = resultado2;
