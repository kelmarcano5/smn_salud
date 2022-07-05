select
		smn_salud.smn_series.smn_serie_id,
	smn_salud.smn_series.sri_codigo,
	smn_salud.smn_series.sri_nombre,
	smn_salud.smn_series.sri_estatus,
	smn_salud.smn_series.sri_ultimo_numero,
	smn_salud.smn_series.sri_reinicio,
	smn_salud.smn_series.ctm_fecha_registro
from
	smn_salud.smn_series 
where
	smn_salud.smn_series.smn_series_id = ${fld:id}
