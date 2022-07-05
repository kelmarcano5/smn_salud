select smn_salud.smn_contratante.smn_auxiliar_rf as id, smn_base.smn_auxiliar.aux_codigo ||'-'|| smn_base.smn_auxiliar.aux_descripcion as item 
from smn_base.smn_auxiliar
LEFT outer join smn_salud.smn_contratante on smn_salud.smn_contratante.smn_auxiliar_rf = smn_base.smn_auxiliar.smn_auxiliar_id
where
	smn_salud.smn_contratante.smn_auxiliar_rf is not null