select smn_base.smn_servicios.smn_servicios_id as id, smn_base.smn_servicios.svc_descripcion as item from smn_base.smn_servicios where smn_base.smn_servicios.smn_servicios_id=(select smn_salud.smn_documento.smn_servicio_mmq_rf from smn_salud.smn_documento where smn_salud.smn_documento.smn_documento_id=${fld:smn_documento_id}) 