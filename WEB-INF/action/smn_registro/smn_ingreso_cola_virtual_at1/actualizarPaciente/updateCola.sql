with rows as (
	select smn_salud.smn_series.sri_ultimo_numero as numero
	from smn_salud.smn_series where smn_salud.smn_series.sri_codigo=${fld:serie}
)
UPDATE smn_salud.smn_ingreso_cola_virtual SET
icv_numero_ticket = rows.numero FROM rows
where smn_salud.smn_ingreso_cola_virtual.icv_numero_documento_identidad = upper(${fld:cedula})

