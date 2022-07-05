var aux = '${fld:maneja_sucursal}';
if(aux == 'SI'){
	chgComboAux();
	document.getElementById('contratante_aux_tr').style.display='';
	document.getElementById('cb_cont_area_tr').style.display='';
	document.getElementById('cont_uni_serv_tr').style.display='';
}else{
	document.getElementById('contratante_aux_tr').style.display='none';
	document.getElementById('cb_cont_area_tr').style.display='none';
	document.getElementById('cont_uni_serv_tr').style.display='none';	
}


