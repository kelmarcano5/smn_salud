select smn_salud.smn_observaciones.smn_observaciones_id as id, smn_salud.smn_observaciones.obs_codigo || ' - ' || smn_salud.smn_observaciones.obs_descripcion as item from smn_salud.smn_observaciones 
where smn_salud.smn_observaciones.obs_tipo='CI'
order by smn_salud.smn_observaciones.obs_descripcion