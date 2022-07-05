select 
	rta_ticket, 
	smn_entidad_rf, 
	smn_sucursal_rf, 
	smn_area_servicio_rf, 
	smn_unidad_servicio_rf 
from 
	smn_salud.smn_ruta_paciente 
where 
	rta_estatus = 'PE' and 
	rta_secuencia = 2 and 
	rta_ticket in (
         select igs_ticket 
         from smn_salud.smn_ingresos 
         where smn_ingresos_id = ${fld:id_ingreso}
     ) and 
    rta_fecha_registro = current_date