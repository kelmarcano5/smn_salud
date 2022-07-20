var codigo =  "${fld:codigo}";
var documento =  "${fld:docId}";
var cedula =  "${fld:cedula}";

console.log("codigo " + codigo);
console.log("cedula cita" + cedula);
if(codigo == "CI" || codigo == "PR"){

	 ajaxCall(	
		httpMethod="POST", 
		uri="${def:actionroot}/revisarEstFinan?cedula=" + cedula + "&cita=" + "si", 
		divResponse=null, 
		divProgress="status", 
		formName="form1", 
		afterResponseFn=null)

}else{

	ajaxCall(	
		httpMethod="POST", 
		uri="${def:actionroot}/actualizarPaciente?serie=" + "B" + "&cedula=" + cedula, 
		divResponse=null, 
		divProgress="status", 
		formName="form1", 
		afterResponseFn=null)

}
	


