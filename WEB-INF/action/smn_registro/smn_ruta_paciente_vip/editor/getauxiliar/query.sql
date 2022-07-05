select smn_base.smn_auxiliar.smn_auxiliar_id as id, 
smn_base.smn_auxiliar.aux_nombres || '  ' ||  smn_base.smn_auxiliar.aux_apellidos as item 
from smn_base.smn_auxiliar 
where smn_base.smn_auxiliar.smn_clase_auxiliar_rf = (SELECT smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id
from smn_base.smn_clase_auxiliar
WHERE upper(smn_base.smn_clase_auxiliar.cla_codigo)=upper(${fld:id}))