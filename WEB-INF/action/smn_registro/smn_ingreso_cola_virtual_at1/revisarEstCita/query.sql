select ${fld:cedula} as cedula, e.eci_num_secuencia as estado
from smn_salud.smn_ingreso_cola_virtual v
inner join  smn_salud.smn_citas c on
v.smn_documento_id = c.smn_documento_id
inner join smn_salud.smn_estatus_citas e on
c.smn_estatus_citas_id = e.smn_estatus_citas_id
where upper(icv_numero_documento_identidad) = upper(${fld:cedula})