listboxClear("smn_area_id");

var optionChoose = document.createElement("option");
optionChoose.text = '[${lbl:b_choose}]';
optionChoose.value = "0";
document.form1.smn_area_id.add(optionChoose, 0);
$("#smn_area_id option[value='0']").remove();

<smn_area_id_rows>
	var option = document.createElement("option");
	option.text = "${fld:item@js}"; 
	option.value = "${fld:id}";
	document.form1.smn_area_id.add(option, 0);
</smn_area_id_rows>

var id_op_a = $('#smn_area_id').val();
		var id_txt_a = $('#smn_area_id option:selected').text();
chgCombo3(id_txt_a, id_op_a);
document.form1.smn_unidad_servicio_rf.disabled=true;

