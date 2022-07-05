select
select
	smn_base.smn_unidad_medida.unm_descripcion,
	case
	when smn_salud.smn_coberturas.cob_otros_centros='S' then '${lbl:b_yes}'
	when smn_salud.smn_coberturas.cob_otros_centros='N' then '${lbl:b_not}'
	end as cob_otros_centros_combo,
	smn_salud.smn_coberturas.*
from
	smn_base.smn_unidad_medida,
	smn_salud.smn_coberturas
where
	smn_base.smn_unidad_medida.smn_unidad_medida_id = smn_salud.smn_coberturas.cob_unidad_tiempo_rf and
	smn_coberturas_id = ${fld:id}
