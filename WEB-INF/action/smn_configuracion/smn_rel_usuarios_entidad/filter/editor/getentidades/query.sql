select smn_base.smn_entidades.smn_entidades_id as id,
 smn_base.smn_entidades.ent_codigo || ' - ' || smn_base.smn_entidades.ent_descripcion_corta as item 
from smn_base.smn_entidades
where  smn_base.smn_entidades.ent_usuario = (SELECT smn_base.smn_usuarios.usr_usuario
from smn_base.smn_usuarios
where
upper(smn_base.smn_usuarios.usr_nombres)=upper(${fld:id})) 

