package model.entity;
import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.IdentityType;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

@PersistenceCapable(identityType = IdentityType.APPLICATION)
public class Pedido {
	@PrimaryKey
	@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	private Long id;
	@Persistent
	private int cantidad;
	@Persistent
	private String nameProducto;
	@Persistent
	private double precio;
	
	public Pedido(String nameProducto,int cantidad){
		this.nameProducto = nameProducto;
		this.cantidad = cantidad;
	}
	public Pedido(String nameProducto,int cantidad, double precio){
		this.nameProducto = nameProducto;
		this.cantidad = cantidad;
		this.precio = precio;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getNameProducto() {
		return nameProducto;
	}

	public int getCantidad() {
		return cantidad;
	}
	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}
	public void setNameProducto(String nameProducto) {
		this.nameProducto = nameProducto;
	}

	public double getPrecio() {
		return precio;
	}

	public void setPrecio(double precio) {
		this.precio = precio;
	}
	
}
