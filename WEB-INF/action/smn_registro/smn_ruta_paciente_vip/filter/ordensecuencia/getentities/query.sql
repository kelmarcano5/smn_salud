SELECT 
smn_base.smn_entidades.smn_entidades_id as id,
smn_base.smn_entidades.ent_codigo||'-'||smn_base.smn_entidades.ent_descripcion_corta as item 
from smn_base.smn_entidades
left outer join smn_salud.smn_ingreso_cola_virtual on smn_salud.smn_ingreso_cola_virtual.smn_entidad_rf=smn_base.smn_entidades.smn_entidades_id
where smn_base.smn_entidades.smn_entidades_id=(SELECT smn_salud.smn_ingreso_cola_virtual.smn_entidad_rf
from smn_salud.smn_ingreso_cola_virtual
where
upper(smn_salud.smn_ingreso_cola_virtual.icv_numero_documento_identidad)=upper(${fld:id})) 