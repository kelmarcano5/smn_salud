select 
	smn_clase_auxiliar_rf, 
	smn_auxiliar_rf, 
	rta_numero_documento_identidad, 
	smn_entidad_rf, 
	smn_sucursal_rf, 
	smn_area_servicio_rf, 
	smn_serie_id, 
	rta_ticket, 
	smn_unidad_servicio_rf,
	rta_estatus 
from 
	smn_salud.smn_ruta_paciente 
where 
	smn_ruta_paciente.rta_estatus in ('EA','RV') and 
	smn_ruta_paciente.rta_secuencia = 1 and 
	smn_ruta_paciente.rta_ticket in (
		select 
			igs_ticket 
        from 
        	smn_salud.smn_ingresos 
        where 
        	smn_ingresos_id = ${fld:id_ingreso}
     ) and 
    rta_fecha_registro = current_date