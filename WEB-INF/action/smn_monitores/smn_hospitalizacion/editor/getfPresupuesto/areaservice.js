$('#smn_doc_orig').prop( "disabled", false );
listboxClear("smn_doc_orig");

var optionChoose = document.createElement("option");
optionChoose.text = '[${lbl:b_choose}]';
optionChoose.value = "0";
document.form1.smn_doc_orig.add(optionChoose, 0);

<smn_doc_orig_rows>
	var option = document.createElement("option");
	option.text = "${fld:item@js}"; 
	option.value = "${fld:id}";
	document.form1.smn_doc_orig.add(option, 0);
</smn_doc_orig_rows>
