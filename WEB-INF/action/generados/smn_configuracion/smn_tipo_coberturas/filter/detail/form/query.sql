select
	smn_salud.smn_tipo_coberturas.*
from 
	smn_salud.smn_tipo_coberturas
where
	smn_tipo_coberturas_id = ${fld:id}
