listboxClear("smn_contratante_id");

// var optionChoose = document.createElement("option");
// optionChoose.text = '[${lbl:b_choose}]';
// optionChoose.value = "0";
// document.form1.smn_contratante_id.add(optionChoose, 0);

<smn_contratante_id_rows>
	var option = document.createElement("option");
	option.text = "${fld:item@js}"; 
	option.value = "${fld:id}";
	document.form1.smn_contratante_id.add(option, 0);
</smn_contratante_id_rows>
