select  smn_base.smn_auxiliar_cond_financiera.smn_auxiliar_cond_financiera_id as id, 
smn_base.smn_auxiliar_cond_financiera.cfn_codigo|| ' - ' || smn_base.smn_auxiliar_cond_financiera.cfn_descripcion as item 
from smn_base.smn_auxiliar_cond_financiera 
left outer join smn_base.smn_auxiliar on smn_base.smn_auxiliar.aux_condicion_financiera_rf = smn_base.smn_auxiliar_cond_financiera.smn_auxiliar_cond_financiera_id
left outer join smn_salud.smn_contratante on smn_salud.smn_contratante.smn_auxiliar_rf = smn_base.smn_auxiliar.smn_auxiliar_id  
WHERE smn_base.smn_auxiliar.aux_codigo=${fld:id}