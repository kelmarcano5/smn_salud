select	
	smn_salud.smn_coberturas.smn_coberturas_id, 
	smn_salud.smn_coberturas.cob_codigo as cob_codigo_pl0,
	(select smn_salud.smn_coberturas.cob_codigo || ' - ' || smn_salud.smn_coberturas.cob_descripcion from  smn_salud.smn_coberturas  where smn_salud.smn_coberturas.smn_coberturas_id is not null  and smn_salud.smn_coberturas.smn_coberturas_id=smn_salud.smn_coberturas_servicios.smn_coberturas_id  order by smn_salud.smn_coberturas.cob_descripcion ) as smn_coberturas_id_combo,
	(select smn_base.smn_unidades_servicios.uns_codigo || ' - ' || smn_base.smn_unidades_servicios.uns_descripcion from  smn_base.smn_unidades_servicios  where smn_base.smn_unidades_servicios.smn_unidades_servicios_id is not null  and smn_base.smn_unidades_servicios.smn_unidades_servicios_id=smn_salud.smn_coberturas_servicios.smn_unidades_servicios_id  order by smn_base.smn_unidades_servicios.uns_descripcion ) as smn_unidades_servicios_id_combo,
	smn_salud.smn_coberturas_servicios.*
from
	smn_salud.smn_coberturas,
	smn_salud.smn_coberturas_servicios 
where
	smn_salud.smn_coberturas.smn_coberturas_id=smn_salud.smn_coberturas_servicios.smn_coberturas_id 
 and 
	smn_coberturas_servicios_id = ${fld:id}
