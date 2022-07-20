var cedula = '${fld:cedula}';
var ced = '${fld:ced}';
var ticket = '${fld:ticket}';

console.log("la cedula en sistema " + ced);
console.log("la cedulasss" + cedula);


var unidadco = '${fld:smn_unidad}';
console.log("validar usuario sistema: "+unidadco);

var contratante = '${fld:contratante}';
var unidad = '${fld:unidad}';
var grupo = '${fld:grupo}';

 if (cedula == '' && contratante == ''){
 	var serie = 'A'
 		ajaxCall(httpMethod="POST", 
		uri="${def:actionroot}/consultarserie?serie="+serie+"&cedula="+ced+"&contratante="+contratante+"&unidad="+unidad+"&grupo="+grupo+"&smn_unidad="+unidadco, 
		divResponse=null, 
		divProgress="status", 
		formName=null, 
		afterResponseFn=null)
 }

 if(cedula != '' && contratante == ''){
 	var serie = 'B'
 		ajaxCall(httpMethod="POST", 
		uri="${def:actionroot}/consultarserie?serie="+serie+"&cedula="+ced+"&contratante="+contratante+"&unidad="+unidad+"&grupo="+grupo+"&smn_unidad="+unidadco, 
		divResponse=null, 
		divProgress="status", 
		formName=null, 
		afterResponseFn=null)
 }

 if (cedula == '' && contratante != ''){
 	var serie = 'H'
 		ajaxCall(httpMethod="POST", 
		uri="${def:actionroot}/consultarserie?serie="+serie+"&cedula="+ced+"&contratante="+contratante+"&unidad="+unidad+"&grupo="+grupo+"&smn_unidad="+unidadco, 
		divResponse=null, 
		divProgress="status", 
		formName=null, 
		afterResponseFn=null)
 }

  if (cedula != '' && contratante != ''){
 	var serie = 'G'
 		ajaxCall(httpMethod="POST", 
		uri="${def:actionroot}/consultarserie?serie="+serie+"&cedula="+ced+"&contratante="+contratante+"&unidad="+unidad+"&grupo="+grupo+"&smn_unidad="+unidadco, 
		divResponse=null, 
		divProgress="status", 
		formName=null, 
		afterResponseFn=null)
 }

