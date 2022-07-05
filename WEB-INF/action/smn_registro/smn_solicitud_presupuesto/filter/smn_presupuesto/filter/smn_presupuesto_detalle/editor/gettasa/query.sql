select smn_base.smn_tasas_de_cambio.smn_tasas_de_cambio_id as id, 
smn_base.smn_tasas_de_cambio.tca_fecha_vigencia ||' ->'|| smn_base.smn_tasas_de_cambio.tca_tasa_cambio as item,  
smn_base.smn_tasas_de_cambio.tca_tasa_cambio as tasa_cambio 
from smn_base.smn_tasas_de_cambio 
left outer join smn_base.smn_monedas on smn_base.smn_monedas.smn_monedas_id = smn_base.smn_tasas_de_cambio.smn_monedas_id
WHERE
	smn_base.smn_tasas_de_cambio.smn_monedas_id = ${fld:id} 
	AND smn_base.smn_tasas_de_cambio.tca_fecha_vigencia = CURRENT_DATE 
	--AND smn_base.smn_tasas_de_cambio.tca_tipo_tasa = ${fld:tipotasa}
ORDER BY smn_base.smn_tasas_de_cambio.tca_fecha_vigencia DESC limit  1