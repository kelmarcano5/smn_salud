//var pull = '${fld:pull}';


var pool = '${fld:pull}';
console.log('POOL: '+pool);

if (pool == 'SI') {
	$('#tr_prestador').hide();
}else{
	$('#tr_prestador').show();
	//$('#prestador').val('${fld:prestador}');
	//chgCombo3();
	

}


// if (pull=='SI') {
// 	$('#prestador').hide();
// }else{
// 	$('#prestador').show();
// 	chgCombo_Presta();
// }
