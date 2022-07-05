listboxClear("smn_fecha_cita");

var optionChoose = document.createElement("option");
optionChoose.text = '[${lbl:b_choose}]';
optionChoose.value = "0";
document.form1.smn_fecha_cita.add(optionChoose, 0);

<smn_fecha_cita_rows>
	var option = document.createElement("option");
	option.text = "${fld:item@js}"; 
	option.value = "${fld:id}";
	document.form1.smn_fecha_cita.add(option, 0);
</smn_fecha_cita_rows>
