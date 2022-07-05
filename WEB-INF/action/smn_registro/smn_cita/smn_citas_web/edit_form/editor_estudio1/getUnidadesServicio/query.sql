SELECT 
smn_base.smn_unidades_servicios.smn_unidades_servicios_id as id,
smn_base.smn_unidades_servicios.uns_codigo||'-'||smn_base.smn_unidades_servicios.uns_descripcion as item 
from smn_base.smn_areas_servicios, smn_base.smn_unidades_servicios
where smn_base.smn_unidades_servicios.smn_areas_servicios_id in (SELECT smn_base.smn_areas_servicios.smn_areas_servicios_id
from smn_base.smn_areas_servicios
WHERE smn_base.smn_areas_servicios.ase_sucursal=${fld:id}) GROUP BY id