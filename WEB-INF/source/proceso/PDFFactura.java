package proceso;

import java.io.ByteArrayOutputStream;
import com.lowagie.text.*;
import com.lowagie.text.pdf.*;

import dinamica.*;

/**
 * Reporte PDF (IText) Factura.<br>
 * <br><br>
 * Framework Dinamica - Distribuido bajo licencia LGPL<br>
 * @author mcordova (martin.cordova@gmail.com)
 */
public class PDFFactura extends PDFGenericReport
{

    Font tblHeaderFont = null;
    Font tblBodyFont = null;
    
    //tamaños de las columnas del detalle de la factura
    int facturaWidths[] = {10,43,7,8,8,5,7,10};
    
    protected void createPDF(GenericTransaction data, ByteArrayOutputStream buf)
            throws Throwable{
    	
    	//crear fonts por defecto
		tblHeaderFont = new Font(Font.HELVETICA, 10f, Font.BOLD);
		tblBodyFont = new Font(Font.HELVETICA, 10f, Font.NORMAL);
    			
    	super.createPDF(data, buf);

    }
     
    @Override
	protected void beforePrintBody(GenericTransaction data, Document doc, PdfWriter docWriter) throws Throwable {

    	PdfPTable datatable = getEncabezadoFactura(data);
		datatable.setSpacingBefore(40);
		doc.add(datatable);
		
		datatable = getFactura(data);
		datatable.setSpacingBefore(40);
		doc.add(datatable);
    	   	
		
	}

	PdfPTable getEncabezadoFactura(GenericTransaction data) throws Throwable
   	{
       	//definir estructura de la tabla
   		//dejar que IText calcule los anchos de columnas
   		PdfPTable datatable = new PdfPTable(2);
   		int headerwidths[] = {15,85};
   		datatable.setWidths(headerwidths);
   		datatable.getDefaultCell().setPadding(3);
   		datatable.setWidthPercentage(100);
   		
   		Recordset rs = data.getRecordset("query-cabecera.sql");
		rs.first();
		
   		PdfPCell c = null;
   				
   		c = new PdfPCell(new Phrase("EMPRESA", new Font(Font.HELVETICA, 7f, Font.NORMAL)));
   		c.setHorizontalAlignment(Element.ALIGN_LEFT);
   		c.disableBorderSide(PdfPCell.LEFT + PdfPCell.RIGHT + PdfPCell.BOTTOM + PdfPCell.TOP);
   		datatable.addCell(c);
   		
   		c = new PdfPCell(new Phrase("", new Font(Font.HELVETICA, 7f, Font.NORMAL)));
   		c.setHorizontalAlignment(Element.ALIGN_LEFT);
   		c.disableBorderSide(PdfPCell.LEFT + PdfPCell.RIGHT + PdfPCell.BOTTOM + PdfPCell.TOP);
   		datatable.addCell(c);
   		 
   		c = new PdfPCell(new Phrase("VEHICULO", new Font(Font.HELVETICA, 7f, Font.NORMAL)));
   		c.setHorizontalAlignment(Element.ALIGN_LEFT);
   		c.disableBorderSide(PdfPCell.LEFT + PdfPCell.RIGHT + PdfPCell.BOTTOM + PdfPCell.TOP);
   		datatable.addCell(c);
   		
   		c = new PdfPCell(new Phrase("", new Font(Font.HELVETICA, 7f, Font.NORMAL)));
   		c.setHorizontalAlignment(Element.ALIGN_LEFT);
   		c.disableBorderSide(PdfPCell.LEFT + PdfPCell.RIGHT + PdfPCell.BOTTOM + PdfPCell.TOP);
   		datatable.addCell(c);
   		
   		c = new PdfPCell(new Phrase("DOCUMENTO", new Font(Font.HELVETICA, 7f, Font.NORMAL)));
   		c.setHorizontalAlignment(Element.ALIGN_LEFT);
   		c.disableBorderSide(PdfPCell.LEFT + PdfPCell.RIGHT + PdfPCell.BOTTOM + PdfPCell.TOP);
   		datatable.addCell(c);
   		
   		c = new PdfPCell(new Phrase("", new Font(Font.HELVETICA, 7f, Font.NORMAL)));
   		c.setHorizontalAlignment(Element.ALIGN_LEFT);
   		c.disableBorderSide(PdfPCell.LEFT + PdfPCell.RIGHT + PdfPCell.BOTTOM + PdfPCell.TOP);
   		datatable.addCell(c);
   		 
   		c = new PdfPCell(new Phrase("INGRESO", new Font(Font.HELVETICA, 7f, Font.NORMAL)));
   		c.setHorizontalAlignment(Element.ALIGN_LEFT);
   		c.disableBorderSide(PdfPCell.LEFT + PdfPCell.RIGHT + PdfPCell.BOTTOM + PdfPCell.TOP);
   		datatable.addCell(c);
   		
   		c = new PdfPCell(new Phrase("", new Font(Font.HELVETICA, 7f, Font.NORMAL)));
   		c.setHorizontalAlignment(Element.ALIGN_LEFT);
   		c.disableBorderSide(PdfPCell.LEFT + PdfPCell.RIGHT + PdfPCell.BOTTOM + PdfPCell.TOP);
   		datatable.addCell(c);
   		
   		c = new PdfPCell(new Phrase("Nº PRESUPUESTO", new Font(Font.HELVETICA, 7f, Font.NORMAL)));
   		c.setHorizontalAlignment(Element.ALIGN_LEFT);
   		c.disableBorderSide(PdfPCell.LEFT + PdfPCell.RIGHT + PdfPCell.BOTTOM + PdfPCell.TOP);
   		datatable.addCell(c);
   		
   		c = new PdfPCell(new Phrase("", new Font(Font.HELVETICA, 7f, Font.NORMAL)));
   		c.setHorizontalAlignment(Element.ALIGN_LEFT);
   		c.disableBorderSide(PdfPCell.LEFT + PdfPCell.RIGHT + PdfPCell.BOTTOM + PdfPCell.TOP);
   		datatable.addCell(c);
   		
   		c = new PdfPCell(new Phrase("FECHA REGISTRO", new Font(Font.HELVETICA, 7f, Font.NORMAL)));
   		c.setHorizontalAlignment(Element.ALIGN_LEFT);
   		c.disableBorderSide(PdfPCell.LEFT + PdfPCell.RIGHT + PdfPCell.BOTTOM + PdfPCell.TOP);
   		datatable.addCell(c);
   		
   		c = new PdfPCell(new Phrase("", new Font(Font.HELVETICA, 7f, Font.NORMAL)));
   		c.setHorizontalAlignment(Element.ALIGN_LEFT);
   		c.disableBorderSide(PdfPCell.LEFT + PdfPCell.RIGHT + PdfPCell.BOTTOM + PdfPCell.TOP);
   		datatable.addCell(c);
   		
   		return datatable;
       	
   	}
    
    PdfPTable getFactura(GenericTransaction data) throws Throwable
   	{
       	//definir estructura de la tabla
   		//dejar que IText calcule los anchos de columnas
   		PdfPTable datatable = new PdfPTable(8);
   		datatable.setWidths(facturaWidths);
   		datatable.getDefaultCell().setPadding(3);
   		datatable.setWidthPercentage(100);
   		
   		PdfPCell c = null;
   		
   		//ENCABEZADO
   		c = new PdfPCell(new Phrase("PRESUPUESTO", new Font(Font.HELVETICA, 6f, Font.BOLD)));
   		c.setHorizontalAlignment(Element.ALIGN_CENTER);
   		datatable.addCell(c);
   		
   		c = new PdfPCell(new Phrase("SERVICIO", new Font(Font.HELVETICA, 6f, Font.BOLD)));
   		c.setHorizontalAlignment(Element.ALIGN_CENTER);
   		datatable.addCell(c);
   		
   		c = new PdfPCell(new Phrase("ITEM", new Font(Font.HELVETICA, 6f, Font.BOLD)));
   		c.setHorizontalAlignment(Element.ALIGN_CENTER);
   		datatable.addCell(c);
   		
   		c = new PdfPCell(new Phrase("CANTIDAD", new Font(Font.HELVETICA, 6f, Font.BOLD)));
   		c.setHorizontalAlignment(Element.ALIGN_CENTER);
   		datatable.addCell(c);
   		
   		c = new PdfPCell(new Phrase("PRECIO LOCAL", new Font(Font.HELVETICA, 6f, Font.BOLD)));
   		c.setHorizontalAlignment(Element.ALIGN_CENTER);
   		datatable.addCell(c);
   		
   		c = new PdfPCell(new Phrase("MONTO LOCAL", new Font(Font.HELVETICA, 6f, Font.BOLD)));
   		c.setHorizontalAlignment(Element.ALIGN_CENTER);
   		datatable.addCell(c);
   		
   		c = new PdfPCell(new Phrase("PRECIO MA", new Font(Font.HELVETICA, 6f, Font.BOLD)));
   		c.setHorizontalAlignment(Element.ALIGN_CENTER);
   		datatable.addCell(c);
   		
   		c = new PdfPCell(new Phrase("MONTO MA", new Font(Font.HELVETICA, 6f, Font.BOLD)));
   		c.setHorizontalAlignment(Element.ALIGN_CENTER);
   		datatable.addCell(c);
   		
   		c = new PdfPCell(new Phrase("FECHA REGISTRO", new Font(Font.HELVETICA, 6f, Font.BOLD)));
   		c.setHorizontalAlignment(Element.ALIGN_CENTER);
   		datatable.addCell(c);
   		//ENCABEZADO
   		
   		Recordset rs = data.getRecordset("query-detalle.sql");
   		
   		rs.top();
   		while(rs.next()) {
   			
   			c = new PdfPCell(new Phrase(rs.getString("smn_presupuesto_id_combo"), new Font(Font.HELVETICA, 7f, Font.NORMAL)));
   	   		c.setHorizontalAlignment(Element.ALIGN_CENTER);
   	   		datatable.addCell(c);
   	   		
   	   		c = new PdfPCell(new Phrase(rs.getString("smn_servicios_rf"), new Font(Font.HELVETICA, 7f, Font.NORMAL)));
   	   		c.setHorizontalAlignment(Element.ALIGN_LEFT);
   	   		datatable.addCell(c);
   			
   			c = new PdfPCell(new Phrase(rs.getString("smn_componentes_rf"), new Font(Font.HELVETICA, 7f, Font.NORMAL)));
   	   		c.setHorizontalAlignment(Element.ALIGN_CENTER);
   	   		datatable.addCell(c);
   	   		
   	   		/*c = new PdfPCell(new Phrase(rs.getString("prd_cantidad"), new Font(Font.HELVETICA, 7f, Font.NORMAL)));
   	   		c.setHorizontalAlignment(Element.ALIGN_LEFT);
   	   		datatable.addCell(c);*/
   	   		
   	   		c = new PdfPCell(new Phrase(dinamica.StringUtil.formatNumber(rs.getDouble("prd_cantidad"), "#,###,##0.00"), new Font(Font.HELVETICA, 7f, Font.NORMAL)));
	   		c.setHorizontalAlignment(Element.ALIGN_RIGHT);
	   		datatable.addCell(c);
   	   		
   	   		c = new PdfPCell(new Phrase(dinamica.StringUtil.formatNumber(rs.getDouble("prd_precio"), "#,###,##0.00"), new Font(Font.HELVETICA, 7f, Font.NORMAL)));
   	   		c.setHorizontalAlignment(Element.ALIGN_RIGHT);
   	   		datatable.addCell(c);
   	   		
   	   		/*c = new PdfPCell(new Phrase(rs.getString("xxxx"), new Font(Font.HELVETICA, 7f, Font.NORMAL)));
   	   		c.setHorizontalAlignment(Element.ALIGN_CENTER);
   	   		datatable.addCell(c);*/
   	   		
   	   		c = new PdfPCell(new Phrase(dinamica.StringUtil.formatNumber(rs.getDouble("prd_monto_moneda_local"), "#,###,##0.00"), new Font(Font.HELVETICA, 7f, Font.NORMAL)));
   	   		c.setHorizontalAlignment(Element.ALIGN_RIGHT);
   	   		datatable.addCell(c);
   	   		
   	   		c = new PdfPCell(new Phrase(dinamica.StringUtil.formatNumber(rs.getDouble("prd_precio_ma"), "#,###,##0.00"), new Font(Font.HELVETICA, 7f, Font.NORMAL)));
   	   		c.setHorizontalAlignment(Element.ALIGN_RIGHT);
   	   		datatable.addCell(c);
   	   		
   	   		c = new PdfPCell(new Phrase(dinamica.StringUtil.formatNumber(rs.getDouble("prd_moneda_alterna"), "#,###,##0.00"), new Font(Font.HELVETICA, 7f, Font.NORMAL)));
   	   		c.setHorizontalAlignment(Element.ALIGN_RIGHT);
   	   		datatable.addCell(c);
   	   		
   	   		c = new PdfPCell(new Phrase(rs.getString("prd_fecha_registro"), new Font(Font.HELVETICA, 7f, Font.NORMAL)));
	   		c.setHorizontalAlignment(Element.ALIGN_CENTER);
	   		datatable.addCell(c);
   	   		
   	   		/*c = new PdfPCell(new Phrase(dinamica.StringUtil.formatNumber(rs.getDouble("xxxx"), "#,###,##0.00"), new Font(Font.HELVETICA, 7f, Font.NORMAL)));
   	   		c.setHorizontalAlignment(Element.ALIGN_RIGHT);
   	   		datatable.addCell(c);*/
   		}
   	
   		return datatable;
       	
   	}
	
}
