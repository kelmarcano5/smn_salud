UPDATE smn_salud.smn_ruta_paciente set rta_estatus =  
(CASE WHEN (rta_estatus = 'EA') THEN 'RV' 
    WHEN (rta_estatus = 'PE') THEN 'EG' 
    WHEN (rta_estatus = 'RV') THEN 'EA' 
 END)
 WHERE rta_secuencia = 1 and rta_ticket IN (
     SELECT igs_ticket 
     FROM smn_salud.smn_ingresos 
     WHERE smn_ingresos_id = ${fld:id}
 ) and rta_fecha_registro = current_date;



