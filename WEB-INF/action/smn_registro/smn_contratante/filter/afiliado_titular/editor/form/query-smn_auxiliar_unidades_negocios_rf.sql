select smn_base.smn_auxiliar_unidades_negocios.smn_auxiliar_unidades_negocios_id as id, smn_base.smn_auxiliar_unidades_negocios.tun_codigo|| ' - ' || 
smn_base.smn_auxiliar_unidades_negocios.tun_nombre as item 
from smn_base.smn_auxiliar_unidades_negocios 
LEFT OUTER JOIN smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_base.smn_auxiliar_unidades_negocios.smn_auxiliar_rf
WHERE
upper(smn_base.smn_auxiliar.aux_codigo) = upper(${fld:codigo_ter})
order by smn_base.smn_auxiliar_unidades_negocios.tun_nombre