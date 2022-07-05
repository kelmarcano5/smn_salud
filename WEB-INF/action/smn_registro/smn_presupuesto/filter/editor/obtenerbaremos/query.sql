select 
	smn_salud.smn_contratante.smn_baremos_id as baremos_id
from smn_salud.smn_contratante
where
	smn_salud.smn_contratante.smn_contratante_id=${fld:id}