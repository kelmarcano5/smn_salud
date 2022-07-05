var auxi = '${fld:id}';
//listboxClear("cts_auxiliar");
 $("#cts_auxiliar option[value="+ auxi +"]").attr("selected",true);
//$("#cts_auxiliar option[value='']").remove();
alert(auxi);
//$('cts_auxiliar').val(auxi);



// var optionChoose = document.createElement("option");
// optionChoose.text = '[${lbl:b_choose}]';
// optionChoose.value = "0";
// document.form1.cts_auxiliar.add(optionChoose, 0);

// <cts_auxiliar_rows>
// 	var option = document.createElement("option");
// 	option.text = "${fld:item@js}"; 
// 	option.value = "${fld:id}";
// 	document.form1.cts_auxiliar.add(option, 0);
// </cts_auxiliar_rows>