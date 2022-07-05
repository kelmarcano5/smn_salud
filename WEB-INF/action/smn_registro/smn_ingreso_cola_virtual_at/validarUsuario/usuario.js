var cedula = '${fld:cedula}';
var ced = '${fld:ced}';
var ticket = '${fld:ticket}';

var unid = '${fld:smn_unidad}';
//alert("LLEGO A VALIDARUSUARIO: "+unid);

var contratante = '${fld:contratante}';
var unidad = '${fld:unidad}';
var grupo = '${fld:grupo}';

if (cedula == ''){

	var uri="${def:actionroot}/validarUsuarioSistema?cedula=" + ced + "&contratante="+contratante+"&unidad="+unidad+"&grupo="+grupo+"&ticket="+ticket+"&smn_unidad="+unid;
	console.log(uri);
	 
	ajaxCall(	
			httpMethod="POST", 
			uri, 
			divResponse=null, 
			divProgress="status", 
			formName="form1", 
			afterResponseFn=null)

}else if (cedula != '' && ticket != 0){

	alertBox ('${lbl:b_ticket_existe}', '${lbl:b_continue_button}', null);
}	
// }else if (cedula != "" && ticket == 0){

// 	var uri="${def:actionroot}/validarUsuarioSistema?cedula=" + ced + "&contratante="+contratante+"&unidad="+unidad+"&grupo="+grupo+"&ticket="+ticket;
// 	console.log(uri);
 
// 	ajaxCall(	
// 			httpMethod="POST", 
// 			uri, 
// 			divResponse=null, 
// 			divProgress="status", 
// 			formName="form1", 
// 			afterResponseFn=null)

// }else if (cedula != "" && contratante != '') {
// 	var uri="${def:actionroot}/validarUsuarioSistema?cedula=" + ced + "&contratante="+contratante+"&unidad="+unidad+"&grupo="+grupo+"&ticket="+ticket;
// 	console.log(uri);
 
// 	ajaxCall(	
// 			httpMethod="POST", 
// 			uri, 
// 			divResponse=null, 
// 			divProgress="status", 
// 			formName="form1", 
// 			afterResponseFn=null)
// }

document.getElementById("write").value = "";

