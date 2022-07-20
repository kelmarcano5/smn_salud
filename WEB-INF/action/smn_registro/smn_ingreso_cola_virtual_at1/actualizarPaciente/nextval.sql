with rows as (
		select smn_salud.smn_series.sri_ultimo_numero+1 as id, smn_salud.smn_series.sri_codigo as serie,  ${fld:cedula} as cedula 
		from smn_salud.smn_series where smn_salud.smn_series.sri_codigo =${fld:serie}
)select * from rows as id