select smn_base.smn_municipios.smn_municipios_id as id, 
smn_base.smn_municipios.mun_codigo || ' - ' || smn_base.smn_municipios.mun_nombre_corto as item 
from smn_base.smn_municipios
where  smn_base.smn_municipios.mun_ciudades = (SELECT smn_base.smn_ciudades.smn_ciudades_id
from smn_base.smn_ciudades
where
upper(smn_base.smn_ciudades.ciu_nombre_corto)=upper(${fld:id})) 