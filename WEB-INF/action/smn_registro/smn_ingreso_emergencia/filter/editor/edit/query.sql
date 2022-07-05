select	
	smn_salud.smn_ingresos.*,
	smn_salud.smn_ingresos.smn_documento_id
from 
	smn_salud.smn_ingresos
	left join smn_salud.smn_presupuesto on smn_salud.smn_presupuesto.smn_presupuesto_id = smn_salud.smn_ingresos.smn_doc_orig
where 
	smn_salud.smn_ingresos.smn_ingresos_id = ${fld:id} --and smn_salud.smn_ingresos.smn_doc_orig is not null


