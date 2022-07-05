select  smn_base.smn_auxiliar_cond_financiera.smn_auxiliar_cond_financiera_id as id, 
smn_base.smn_auxiliar_cond_financiera.cfn_codigo|| ' - ' || smn_base.smn_auxiliar_cond_financiera.cfn_descripcion as item 
from smn_base.smn_auxiliar_cond_financiera 
left outer join smn_base.smn_auxiliar on smn_base.smn_auxiliar.aux_condicion_financiera_rf = smn_base.smn_auxiliar_cond_financiera.smn_auxiliar_cond_financiera_id
where smn_base.smn_auxiliar.aux_num_doc_oficial=${fld:id}