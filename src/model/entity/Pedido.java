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
	private String productoLong;
	@Persistent
	private String nameProducto;
	@Persistent
	private int cantidad;
	@Persistent
	private double precio;
	

	
	public Pedido(String productoLong, String nameProducto, int cantidad) {
		this.productoLong = productoLong;
		this.nameProducto = nameProducto;
		this.cantidad = cantidad;
	}
	public Pedido(String productoLong, String nameProducto, int cantidad, double precio) {
		this.productoLong = productoLong;
		this.nameProducto = nameProducto;
		this.cantidad = cantidad;
		this.precio = precio;
	}
	public Long getId() {
		return id;
	}
	
	public String getProductoLong() {
		return productoLong;
	}
	public void setProductoLong(String productoLong) {
		this.productoLong = productoLong;
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
