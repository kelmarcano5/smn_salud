select a.smn_auxiliar_id as id,
	   a.aux_codigo || ' - ' || a.aux_nombres || ' - ' || a.aux_apellidos as item
from smn_base.smn_auxiliar a 
inner join smn_base.smn_clase_auxiliar on smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id = a.smn_clase_auxiliar_rf
where smn_base.smn_clase_auxiliar.cla_codigo='PA'