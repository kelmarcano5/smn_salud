SELECT 
smn_base.smn_areas_servicios.smn_areas_servicios_id as id,
smn_base.smn_areas_servicios.ase_codigo||'-'||smn_base.smn_areas_servicios.ase_descripcion as item 
from smn_base.smn_areas_servicios
where smn_base.smn_areas_servicios.smn_areas_servicios_id=(SELECT smn_base.smn_rel_servicio_area_unidad.smn_areas_servicios_rf
from smn_base.smn_rel_servicio_area_unidad
WHERE smn_base.smn_rel_servicio_area_unidad.smn_servicios_id=${fld:id})