$('#smn_presupuesto_id').prop( "disabled", false );
listboxClear("smn_presupuesto_id");

var optionChoose = document.createElement("option");
optionChoose.text = '[${lbl:b_choose}]';
optionChoose.value = "0";
document.form1.smn_presupuesto_id.add(optionChoose, 0);

<smn_presupuesto_id_rows>
	var option = document.createElement("option");
	option.text = "${fld:item@js}"; 
	option.value = "${fld:id}";
	document.form1.smn_presupuesto_id.add(option, 0);
</smn_presupuesto_id_rows>
