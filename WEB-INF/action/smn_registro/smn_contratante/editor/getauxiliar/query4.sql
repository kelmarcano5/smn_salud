SELECT 
smn_base.smn_auxiliar.smn_auxiliar_id as id,
smn_base.smn_auxiliar.aux_descripcion as item 
from smn_base.smn_auxiliar
where smn_base.smn_auxiliar.smn_auxiliar_id is not null and 
smn_base.smn_auxiliar.aux_descripcion is not null and smn_base.smn_auxiliar.smn_clase_auxiliar_rf=(${fld:id}) order by smn_base.smn_auxiliar.aux_descripcion desc