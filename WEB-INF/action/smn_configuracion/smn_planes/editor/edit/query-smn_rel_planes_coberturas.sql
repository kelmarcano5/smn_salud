select
	smn_salud.smn_rel_planes_coberturas.*,
	smn_salud.smn_coberturas.*
from 
	smn_salud.smn_rel_planes_coberturas,
	smn_salud.smn_coberturas
where 
	smn_salud.smn_rel_planes_coberturas.smn_planes_id = ${fld:id} and
	smn_salud.smn_rel_planes_coberturas.smn_coberturas_id = smn_salud.smn_coberturas.smn_coberturas_id