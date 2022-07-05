select
	smn_base.smn_auxiliar_persona_natural.smn_auxiliar_persona_natural_id as id_auxiliar
from
	smn_base.smn_auxiliar_persona_natural
where
	smn_base.smn_auxiliar_persona_natural.ant_num_doc_oficial = (select smn_base.smn_auxiliar.aux_num_doc_oficial
																from smn_base.smn_usuarios
																inner join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_base.smn_usuarios.smn_auxiliar_rf
																where smn_base.smn_usuarios.smn_user_rf = (select user_id
																											from ${schema}s_user
																											where ${schema}s_user.userlogin = '${def:user}'))
