select smn_salud.smn_ingresos.*,
smn_salud.smn_cobertura_admision.smn_tasa_rf
from smn_salud.smn_ingresos 
inner join smn_salud.smn_cobertura_admision on smn_salud.smn_cobertura_admision.smn_ingreso_id = smn_salud.smn_ingresos.smn_ingresos_id
where smn_salud.smn_ingresos.smn_ingresos_id=${fld:smn_ingresos_id}
