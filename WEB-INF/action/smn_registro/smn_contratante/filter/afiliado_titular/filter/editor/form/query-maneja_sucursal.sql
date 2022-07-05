select smn_base.smn_auxiliar.aux_maneja_sucursal as aux_maneja_sucursal from 
smn_base.smn_auxiliar 
left outer join smn_base.smn_auxiliar_terceros on smn_base.smn_auxiliar_terceros.smn_auxiliar_terceros_id = smn_base.smn_auxiliar.smn_auxiliar_id
WHERE
upper(smn_base.smn_auxiliar.aux_codigo) = upper(${fld:codigo_ter})