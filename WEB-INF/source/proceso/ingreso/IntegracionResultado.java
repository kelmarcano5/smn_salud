package proceso.ingreso;

public enum IntegracionResultado {
	EN_PROCESO(1), 
	REGISTRADO(2), 
	RECHAZADO(3),
	REVERTIDO(4); 
	
	private final int status;
	
	private IntegracionResultado(int status) {
		this.status = status;
	}
	
	public int toInt() {
		return status;
	}
}
