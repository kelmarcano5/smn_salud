select 
	smn_base.smn_auxiliar_areas_servicios.smn_auxiliar_areas_servicios_id as id, 
	smn_base.smn_auxiliar_areas_servicios.tse_codigo ||' - '|| smn_base.smn_auxiliar_areas_servicios.tse_descripcion as item 
from smn_base.smn_auxiliar_areas_servicios
where smn_base.smn_auxiliar_areas_servicios.tse_auxiliar_sucursal=${fld:id}