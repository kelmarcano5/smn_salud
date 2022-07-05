select 
	smn_mov_caja_cabecera_id
from 
	smn_caja.smn_mov_caja_cabecera 
where 
	mcc_documento_rf = ${fld:smn_documento_id} and 
 	mcc_cod_descripcion_orig = ${fld:descripcion_origen} and 
 	smn_num_doc_origen_rf = ${fld:igs_num_ingreso} and 
 	mcc_doc_referencia = '${fld:igs_ticket}' and 
 	smn_clase_auxiliar_rf = ${fld:smn_clase_rf} and 
 	smn_auxiliar_rf = ${fld:smn_auxiliar_rf} and 
 	mcc_fecha_registro = current_date 
order by smn_mov_caja_cabecera_id asc 
limit 1 
