select 
	smn_control_recibo_id, rcr_serie || ' ' || rcr_numero_control_final as rcr_numero_control_final 
from 
	smn_caja.smn_control_recibo 
where 
	smn_caja_id = ${fld:smn_caja_id} 
limit 1
