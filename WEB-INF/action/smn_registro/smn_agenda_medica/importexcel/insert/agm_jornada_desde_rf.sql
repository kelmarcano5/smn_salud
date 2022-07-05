select 
	smn_base.smn_agenda.smn_agenda_id as agm_jornada_desde_rf_ref 
from   
	smn_base.smn_agenda 
where  
	upper(smn_base.smn_agenda.age_descripcion) = upper(${fld:agm_jornada_desde_rf_desc})
