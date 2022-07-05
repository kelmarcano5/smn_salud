package proceso.ingreso;

public class OrdenIngresoResultado {
	private int rcInserted;
	private int rcUpdated;
	private int rcDeleted;
	public OrdenIngresoResultado() {
		this.rcInserted = 0;
		this.rcUpdated = 0;
		this.rcDeleted = 0;
	}
	public int getRcInserted() {
		return rcInserted;
	}
	public void setRcInserted(int rcInserted) {
		this.rcInserted += rcInserted;
	}
	public int getRcUpdated() {
		return rcUpdated;
	}
	public void setRcUpdated(int rcUpdated) {
		this.rcUpdated += rcUpdated;
	}
	public int getRcDeleted() {
		return rcDeleted;
	}
	public void setRcDeleted(int rcDeleted) {
		this.rcDeleted += rcDeleted;
	}
	public int getTransactionNumber() {
		return rcInserted + rcUpdated + rcUpdated;
	}
}
