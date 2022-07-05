select smn_base.smn_prestadores_servicios.smn_prestadores_servicios_id as id, smn_base.smn_prestadores_servicios.prs_codigo || ' - ' || smn_base.smn_prestadores_servicios.prs_descripcion as item from smn_base.smn_prestadores_servicios order by smn_base.smn_prestadores_servicios.prs_descripcion

-- select smn_base.smn_prestadores_servicios.smn_prestadores_servicios_id as id, 
-- smn_base.smn_prestadores_servicios.prs_codigo || ' - ' || smn_base.smn_prestadores_servicios.prs_descripcion  as item from smn_base.smn_prestadores_servicios 
-- inner join smn_base.smn_usuarios on smn_base.smn_usuarios.smn_auxiliar_rf = smn_base.smn_prestadores_servicios.prs_auxiliar
-- inner join smn_seguridad.s_user on smn_seguridad.s_user.user_id = smn_base.smn_usuarios.smn_user_rf
-- where smn_seguridad.s_user.userlogin='${def:user}'
-- order by smn_base.smn_prestadores_servicios.prs_descripcion