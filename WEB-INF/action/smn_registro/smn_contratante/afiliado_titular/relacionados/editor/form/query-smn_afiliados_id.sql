select smn_salud.smn_afiliado_titular.smn_afiliados_id as id, 
smn_base.smn_auxiliar.aux_codigo || ' - ' || smn_base.smn_auxiliar.aux_descripcion as item 
from  smn_salud.smn_afiliado_titular  
left outer join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_salud.smn_afiliado_titular.afi_auxiliar_rf
order by smn_salud.smn_afiliado_titular.smn_contratante_id 