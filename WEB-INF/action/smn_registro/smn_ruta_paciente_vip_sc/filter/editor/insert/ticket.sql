with rows as (
		select smn_salud.smn_series.sri_ultimo_numero+1 as numero, smn_salud.smn_series.sri_codigo as cod 
		from smn_salud.smn_series where smn_salud.smn_series.sri_codigo =${fld:smn_serie_id}
)
UPDATE smn_salud.smn_series  set sri_ultimo_numero= rows.numero
FROM rows
    where smn_salud.smn_series.sri_codigo = ${fld:smn_serie_id}