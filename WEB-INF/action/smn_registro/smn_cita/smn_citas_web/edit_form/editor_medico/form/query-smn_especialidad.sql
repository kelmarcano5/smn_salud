select smn_base.smn_especialidad.smn_especialidad_id as id, smn_base.smn_especialidad.esp_codigo || ' - ' || smn_base.smn_especialidad.esp_descripcion  as item from smn_base.smn_especialidad order by smn_base.smn_especialidad.esp_descripcion