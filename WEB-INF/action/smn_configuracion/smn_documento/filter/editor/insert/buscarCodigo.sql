select
		smn_salud.smn_documento.doc_codigo
from
		smn_salud.smn_documento
where		
		upper(smn_salud.smn_documento.doc_codigo) = upper(${fld:doc_codigo})
