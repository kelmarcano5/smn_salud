select smn_base.smn_auxiliar_persona_natural.smn_auxiliar_persona_natural_id as id,
 smn_base.smn_auxiliar_persona_natural.ant_num_doc_oficial || ' - ' ||
  smn_base.smn_auxiliar_persona_natural.ant_nombres || ' - ' || 
  smn_base.smn_auxiliar_persona_natural.ant_apellidos as item 
  from smn_base.smn_auxiliar_persona_natural where 
  smn_base.smn_auxiliar_persona_natural.smn_clase_auxiliar_id = 26 
  order by smn_base.smn_auxiliar_persona_natural.ant_num_doc_oficial