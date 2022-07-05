var cedula = '${fld:cedula}';
var ced = '${fld:ced}';

console.log("la cedula en sistema " + ced);
console.log("la cedulasss" + cedula);
if (cedula == ''){
	
ajaxCall(	
		httpMethod="POST", 
		uri="${def:actionroot}/nuevoUsuario?serie=" + "A" + "&cedula=" + ced, 
		divResponse=null, 
		divProgress="status", 
		formName="form1", 
		afterResponseFn=null)

	

}else{

	 ajaxCall(	
		httpMethod="POST", 
		uri="${def:actionroot}/nuevoUsuario?serie=" + "B" + "&cedula=" + ced, 
		divResponse=null, 
		divProgress="status", 
		formName="form1", 
		afterResponseFn=null)

	
}