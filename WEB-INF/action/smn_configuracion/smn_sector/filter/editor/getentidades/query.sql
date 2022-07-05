select smn_base.smn_entidades_federales.smn_entidades_federales_id as id, 
smn_base.smn_entidades_federales.efe_codigo || ' - ' || smn_base.smn_entidades_federales.efe_nombre_corto as item 
from smn_base.smn_entidades_federales
where  smn_base.smn_entidades_federales.efe_paises = (SELECT smn_base.smn_paises.smn_paises_id
from smn_base.smn_paises
where
upper(smn_base.smn_paises.pai_nombre_corto)=upper(${fld:id})) 