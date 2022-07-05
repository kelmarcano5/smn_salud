select smn_base.smn_parroquias.smn_parroquias_id as id, 
smn_base.smn_parroquias.prr_codigo || ' - ' || smn_base.smn_parroquias.prr_nombre_corto as item 
from smn_base.smn_parroquias
where  smn_base.smn_parroquias.prr_municipios = (SELECT smn_base.smn_municipios.smn_municipios_id
from smn_base.smn_municipios
where
upper(smn_base.smn_municipios.mun_nombre_corto)=upper(${fld:id}) and smn_base.smn_municipios.mun_ciudades = (SELECT smn_base.smn_ciudades.smn_ciudades_id
from smn_base.smn_ciudades
where
upper(smn_base.smn_ciudades.ciu_nombre_corto)=upper(${fld:id2})))