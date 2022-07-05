select
	smn_v_usuarios_2.*
from
	${schema}s_user
inner join smn_base.smn_v_usuarios_2 on 
${schema}s_user.userlogin = smn_base.smn_v_usuarios_2.usr_login
where
	${schema}s_user.userlogin = '${def:user}'
