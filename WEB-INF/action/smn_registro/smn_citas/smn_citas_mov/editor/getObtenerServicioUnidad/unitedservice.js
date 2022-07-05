// var max_pac = '${fld:max_pacientes}';
// var min_pac = '${fld:min_pacientes}';

// $('#max_pacientes').val(max_pac);
// $('#min_pacientes').val(min_pac);

// console.log("PACIENTES MAXIMOS: "+max_pac+" PACIENTES MINIMOS: "+min_pac);

listboxClear("smn_unidades_servicios_rf");

// var optionChoose = document.createElement("option");
// optionChoose.text = '[${lbl:b_choose}]';
// optionChoose.value = "0";
// document.form1.smn_unidades_servicios_rf.add(optionChoose, 0);

<smn_unidades_servicios_rf_rows>
	var option = document.createElement("option");
	option.text = "${fld:item@js}"; 
	option.value = "${fld:id}";
	document.form1.smn_unidades_servicios_rf.add(option, 0);
</smn_unidades_servicios_rf_rows>
