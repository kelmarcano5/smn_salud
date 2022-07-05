
select
	smn_salud.smn_sector.smn_sector_id,
	smn_salud.smn_sector.sec_codigo,
	smn_salud.smn_sector.sec_descripcion,
	(select smn_base.smn_paises.pai_codigo || ' - ' || smn_base.smn_paises.pai_nombre_corto as item from smn_base.smn_paises where smn_base.smn_paises.smn_paises_id is not null and smn_base.smn_paises.smn_paises_id=smn_salud.smn_sector.smn_pais_rf order by smn_base.smn_paises.pai_nombre_corto) as smn_pais_rf_combo,
	(select  smn_base.smn_entidades_federales.efe_codigo || ' - ' || smn_base.smn_entidades_federales.efe_nombre_corto as item from smn_base.smn_entidades_federales where smn_base.smn_entidades_federales.smn_entidades_federales_id is not null and smn_base.smn_entidades_federales.smn_entidades_federales_id =smn_salud.smn_sector.smn_entidades_federales_rf order by smn_base.smn_entidades_federales.efe_nombre_corto) as smn_entidades_federales_rf_combo,
	(select  smn_base.smn_ciudades.ciu_codigo || ' - ' || smn_base.smn_ciudades.ciu_nombre_corto as item from smn_base.smn_ciudades where smn_base.smn_ciudades.smn_ciudades_id is not null and smn_base.smn_ciudades.smn_ciudades_id =smn_salud.smn_sector.smn_ciudades_rf order by smn_base.smn_ciudades.ciu_nombre_corto) as smn_ciudades_rf_combo,
	(select  smn_base.smn_municipios.mun_codigo || ' - ' || smn_base.smn_municipios.mun_nombre_corto as item from smn_base.smn_municipios where smn_base.smn_municipios.smn_municipios_id is not null and smn_base.smn_municipios.smn_municipios_id =smn_salud.smn_sector.smn_municipios_rf order by smn_base.smn_municipios.mun_nombre_corto) as smn_municipios_rf_combo,
	(select  smn_base.smn_parroquias.prr_codigo || ' - ' || smn_base.smn_parroquias.prr_nombre_corto as item from smn_base.smn_parroquias where smn_base.smn_parroquias.smn_parroquias_id is not null and smn_base.smn_parroquias.smn_parroquias_id =smn_salud.smn_sector.smn_parroquias_rf order by smn_base.smn_parroquias.prr_nombre_corto) as smn_parroquias_rf_combo,
	(select smn_base.smn_zonas_postales.zpo_codigo || ' - ' || smn_base.smn_zonas_postales.zpo_sector as item from smn_base.smn_zonas_postales where smn_base.smn_zonas_postales.smn_zonas_postales_id is not null and smn_base.smn_zonas_postales.smn_zonas_postales_id =smn_salud.smn_sector.smn_zonas_postales_rf order by smn_base.smn_zonas_postales.zpo_sector) as smn_zonas_postales_rf_combo
	
from
	smn_salud.smn_sector
where
	smn_sector_id = ${fld:id}
