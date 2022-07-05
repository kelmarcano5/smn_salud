select smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id as id, 
smn_base.smn_clase_auxiliar.cla_codigo|| ' - ' || 
smn_base.smn_clase_auxiliar.cla_nombre as item 
from smn_base.smn_clase_auxiliar
--left outer join smn_base.smn_naturaleza_auxiliar on smn_base.smn_naturaleza_auxiliar.smn_naturaleza_auxiliar_id = smn_base.smn_clase_auxiliar.cla_naturaleza
where 
smn_base.smn_clase_auxiliar.cla_codigo='CN'
	--smn_base.smn_naturaleza_auxiliar.smn_naturaleza_auxiliar_id = 3
order by smn_base.smn_clase_auxiliar.cla_nombre