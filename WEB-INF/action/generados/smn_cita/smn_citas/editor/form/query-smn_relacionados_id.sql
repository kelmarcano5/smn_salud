select smn_salud.smn_relacionados.smn_relacionados_id as id, smn_salud.smn_relacionados.rel_nombres || ' ' || smn_salud.smn_relacionados.rel_apellidos as item from smn_salud.smn_relacionados order by smn_salud.smn_relacionados.rel_nombres