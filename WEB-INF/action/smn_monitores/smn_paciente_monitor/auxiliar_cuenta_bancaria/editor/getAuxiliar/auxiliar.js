listboxClear("smn_auxiliar_rf");

var optionChoose = document.createElement("option");
optionChoose.text = '[${lbl:b_choose}]';
optionChoose.value = "0";
document.form1.smn_auxiliar_rf.add(optionChoose, 0);

<smn_auxiliar_rf_rows>
	var option = document.createElement("option");
	option.text = "${fld:item@js}"; 
	option.value = "${fld:id}";
	document.form1.smn_auxiliar_rf.add(option, 0);
</smn_auxiliar_rf_rows>
document.getElementById('smn_clase_auxiliar_rf').disabled=true;
document.getElementById('smn_auxiliar_rf').disabled=true;