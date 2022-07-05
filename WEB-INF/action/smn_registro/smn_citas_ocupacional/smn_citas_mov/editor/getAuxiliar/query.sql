select smn_base.smn_auxiliar_medico.smn_auxiliar_medico_id as id, smn_base.smn_auxiliar_medico.aam_num_doc_oficial || ' - ' || smn_base.smn_auxiliar_medico.aam_nombres || ' ' ||  smn_base.smn_auxiliar_medico.aam_apellidos as item 
from smn_base.smn_auxiliar_medico 
where smn_base.smn_auxiliar_medico.smn_clase_auxiliar_id = (SELECT smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id
from smn_base.smn_clase_auxiliar where smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id =${fld:id})

