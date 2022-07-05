SELECT 
smn_salud.smn_contratante.smn_contratante_id as id_contratante,	
smn_salud.smn_contratante.cnt_numero_control || ' - ' || smn_base.smn_auxiliar.aux_descripcion as item
	
from 
	smn_salud.smn_contratante,
	smn_base.smn_auxiliar
	
where
	smn_salud.smn_contratante.smn_auxiliar_rf = smn_base.smn_auxiliar.smn_auxiliar_id