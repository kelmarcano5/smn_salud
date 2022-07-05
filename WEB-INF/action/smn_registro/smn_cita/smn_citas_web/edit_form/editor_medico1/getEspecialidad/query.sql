SELECT 
smn_base.smn_especialidad.smn_especialidad_id as id,    
smn_base.smn_especialidad.esp_codigo||'-'||smn_base.smn_especialidad.esp_descripcion as item    
from 
    smn_base.smn_especialidad
where 
    smn_base.smn_especialidad.smn_especialidad_id in (select smn_especialidad_id
                               from smn_base.smn_rel_sucursal_especialidad
                               where smn_sucursales_id = ${fld:id})


	

