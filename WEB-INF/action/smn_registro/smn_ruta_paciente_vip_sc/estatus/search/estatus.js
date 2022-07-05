listboxClear("smn_estatus");

var optionChoose = document.createElement("option");
optionChoose.text = '[${lbl:b_choose}]';
optionChoose.value = "";
document.form1.smn_estatus.add(optionChoose, 0);

<smn_estatus_rows>
	var option = document.createElement("option");
	option.text = "${fld:item@js}"; 
	option.value = "${fld:id}";
	document.form1.smn_estatus.add(option, 0);
</smn_estatus_rows>
