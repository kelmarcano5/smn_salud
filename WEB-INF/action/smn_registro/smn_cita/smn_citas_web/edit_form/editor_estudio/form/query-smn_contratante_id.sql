SELECT 
smn_salud.smn_contratante.smn_contratante_id as id,	
smn_salud.smn_contratante.cnt_numero_control || ' - ' || smn_salud.smn_contratante.smn_auxiliar_rf as item
	
from 
	smn_salud.smn_contratante