select 
	smn_caja_id  
from 
	smn_caja.smn_caja 
where 
	smn_entidad_rf = ${fld:smn_entidad_rf} and 
	smn_sucursal_rf = ${fld:smn_sucursal_rf} and 
	smn_area_servicio_rf = ${fld:smn_area_servicio_rf} and 
	smn_unidad_servicio_rf = ${fld:smn_unidad_servicio_rf} 
limit 1;