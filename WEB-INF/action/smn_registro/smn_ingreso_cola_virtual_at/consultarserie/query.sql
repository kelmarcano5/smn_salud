select smn_salud.smn_series.sri_codigo,
smn_salud.smn_series.smn_contratante_id as contratante_id,
smn_salud.smn_series.sri_paciente_nuevo as nuevo,
smn_salud.smn_series.sri_particular as particular
from smn_salud.smn_series
where smn_salud.smn_series.sri_codigo=${fld:serie}