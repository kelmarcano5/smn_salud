listboxClear("smn_unidades_servicios_id");

var optionChoose = document.createElement("option");
optionChoose.text = '[${lbl:b_choose}]';
optionChoose.value = "0";
document.form1.smn_unidades_servicios_id.add(optionChoose, 0);

<smn_unidades_servicios_id_rows>
	var option = document.createElement("option");
	option.text = "${fld:item@js}"; 
	option.value = "${fld:id}";
	document.form1.smn_unidades_servicios_id.add(option, 0);
</smn_unidades_servicios_id_rows>
