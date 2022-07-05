select 
	smn_base.smn_entidades.smn_entidades_id as pla_empresa_ref 
from   
	smn_base.smn_entidades 
where  
	upper(smn_base.smn_entidades.ent_descripcion_corta) = upper(${fld:pla_empresa_desc})
