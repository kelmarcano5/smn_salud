select smn_base.smn_zonas_postales.smn_zonas_postales_id as id, 
smn_base.smn_zonas_postales.zpo_codigo || ' - ' || smn_base.smn_zonas_postales.zpo_sector as item
from smn_base.smn_zonas_postales
where  smn_base.smn_zonas_postales.zpo_parroquias = (SELECT smn_base.smn_parroquias.smn_parroquias_id
from smn_base.smn_parroquias
where
upper(smn_base.smn_parroquias.prr_nombre_corto)=upper(${fld:id})) 



