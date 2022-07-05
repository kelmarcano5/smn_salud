select	
	smn_salud.smn_tipo_coberturas.smn_tipo_coberturas_id, 
	smn_salud.smn_tipo_coberturas.tco_codigo as tco_codigo_pl0,
	(select smn_base.smn_direccion.dir_codigo || ' - ' || smn_base.smn_direccion.dir_descripcion from  smn_base.smn_direccion  where smn_base.smn_direccion.smn_direccion_id is not null  and smn_base.smn_direccion.smn_direccion_id=smn_salud.smn_coberturas.cob_area_cobertura  order by smn_base.smn_direccion.dir_descripcion ) as cob_area_cobertura_combo,
	(select smn_salud.smn_tipo_coberturas.tco_codigo || ' - ' || smn_salud.smn_tipo_coberturas.tco_descripcion from  smn_salud.smn_tipo_coberturas  where smn_salud.smn_tipo_coberturas.smn_tipo_coberturas_id is not null  and smn_salud.smn_tipo_coberturas.smn_tipo_coberturas_id=smn_salud.smn_coberturas.smn_tipo_coberturas_id  order by smn_tipo_coberturas.tco_descripcion ) as smn_tipo_coberturas_id_combo,
	case
		when smn_salud.smn_coberturas.cob_otros_centros='S' then '${lbl:b_yes}'
		when smn_salud.smn_coberturas.cob_otros_centros='N' then '${lbl:b_not}'
	end as cob_otros_centros_combo,
	smn_salud.smn_coberturas.*
from
	smn_salud.smn_tipo_coberturas,
	smn_salud.smn_coberturas 
where
	smn_salud.smn_tipo_coberturas.smn_tipo_coberturas_id=smn_salud.smn_coberturas.smn_tipo_coberturas_id 
 and 
	smn_coberturas_id = ${fld:id}
