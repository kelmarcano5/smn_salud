
ALTER TABLE smn_salud.smn_planes_coberturas DROP CONSTRAINT fk_smn_planes_coberturas_1,
ADD CONSTRAINT fk_smn_planes_coberturas_1 FOREIGN KEY (smn_planes_id)
REFERENCES smn_salud.smn_planes (smn_planes_id) MATCH SIMPLE
ON DELETE CASCADE;

delete from smn_salud.smn_planes where smn_planes_id = ${fld:id}