update smn_salud.smn_ruta_paciente set 
	rta_estatus =  'AT', 
	rta_hora_salida_unidad = '${def:time}' 
where 
	rta_estatus in ('EA','RV') and 
	rta_secuencia = 1 and 
	rta_ticket in (
         select igs_ticket 
         from smn_salud.smn_ingresos 
         where smn_ingresos_id = ${fld:id_ingreso}
     ) and 
    rta_fecha_registro = current_date;
     
update smn_salud.smn_ruta_paciente set 
	rta_hora_llegada_unidad = '${def:time}' 
where 
	rta_estatus = 'PE' and 
	rta_secuencia = 2 and 
	rta_ticket in (
         select igs_ticket 
         from smn_salud.smn_ingresos 
         where smn_ingresos_id = ${fld:id_ingreso}
     ) and 
    rta_fecha_registro = current_date;