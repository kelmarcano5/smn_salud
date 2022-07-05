select 
	a.smn_auxiliar_persona_natural_id as id, 
	a.ant_num_doc_oficial || ' - ' || a.ant_nombres || ' - ' || a.ant_apellidos as item 
from 
	smn_base.smn_auxiliar_persona_natural a 
inner join 
	smn_base.smn_clase_auxiliar c 
on 
	a.smn_clase_auxiliar_id = c.smn_clase_auxiliar_id 
where 
	c.cla_codigo =  upper('PA')  
order by a.ant_num_doc_oficial