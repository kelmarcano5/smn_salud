select
	mensaje_id,
	mensaje
from
	${schema}mensaje
where
	flag = 1 and
	mensaje_id in (	select
						mensaje_id
					from
						${schema}mensaje_rol
					where
						role_id in (select
										r.role_id
									from
										${schema}s_role r,
										${schema}s_user_role ur,
										${schema}s_user u
									where
										r.role_id = ur.role_id and
										ur.user_id = u.user_id and
										u.userlogin = '${def:user}' and
										r.app_id = 503
									)
					)
union
select
	mensaje_id,
	mensaje
from
	${schema}mensaje
where
	flag = 1 and
	user_id in (select
					u.user_id
				from
					${schema}s_role r,
					${schema}s_user_role ur,
					${schema}s_user u
				where
					r.role_id = ur.role_id and
					ur.user_id = u.user_id and
					u.userlogin = '${def:user}' and
					r.app_id = 503
				)
order by
	mensaje_id desc