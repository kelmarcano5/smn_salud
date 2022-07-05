update smn_salud.smn_reposos_constancias set rpc_estatus = 'GE' where
smn_salud.smn_reposos_constancias.smn_reposos_constancias_id=${fld:id} and smn_salud.smn_reposos_constancias.rpc_estatus = 'RP';

