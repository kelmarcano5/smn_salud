SELECT 
smn_base.smn_auxiliar.smn_auxiliar_id as id,
smn_base.smn_auxiliar.aux_codigo||'-'||smn_base.smn_auxiliar.aux_descripcion as item 
from smn_base.smn_auxiliar
where smn_base.smn_auxiliar.smn_clase_auxiliar_rf=(${fld:id})