select  smn_base.smn_auxiliar_cond_financiera.smn_auxiliar_cond_financiera_id as id, smn_base.smn_auxiliar_cond_financiera.cfn_codigo|| ' - ' || smn_base.smn_auxiliar_cond_financiera.cfn_descripcion as item 
from smn_base.smn_auxiliar_cond_financiera 
where  smn_base.smn_auxiliar_cond_financiera.smn_auxiliar_rf = (select smn_base.smn_auxiliar_persona_natural.smn_auxiliar_persona_natural_id
from smn_base.smn_auxiliar_persona_natural
WHERE upper(smn_base.smn_auxiliar_persona_natural.ant_apellidos)=upper(${fld:id})) 