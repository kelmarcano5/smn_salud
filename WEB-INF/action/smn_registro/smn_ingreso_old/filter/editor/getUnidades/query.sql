select 
	smn_base.smn_auxiliar_unidades_servicios.smn_auxiliar_unidades_servicios_id as id, 
	smn_base.smn_auxiliar_unidades_servicios.tns_codigo ||' - '|| smn_base.smn_auxiliar_unidades_servicios.tns_descripcion as item 
from smn_base.smn_auxiliar_unidades_servicios
where smn_base.smn_auxiliar_unidades_servicios.smn_auxiliar_areas_servicios_id=${fld:id}
