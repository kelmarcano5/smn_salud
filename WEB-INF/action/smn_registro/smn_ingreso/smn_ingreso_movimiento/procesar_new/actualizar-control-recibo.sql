UPDATE smn_caja.smn_control_recibo SET 
	smn_caja_id=?,
	rcr_numero_control_final=?

WHERE
	smn_control_recibo_id=${fld:smn_control_recibo_id}
