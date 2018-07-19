package controller.compras;

import java.io.IOException;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.entity.Clasificacion;
import model.entity.JuegoDeSala;
import model.entity.Pedido;
import model.entity.Producto;
import model.entity.SalaComedor;
import model.entity.Vitrina;
import pmf.entity.PMF;
@SuppressWarnings("serial")
public class ControllerIndexCompras extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		String query2 = "select from " + Producto.class.getName();
		List<Producto> listaPedido = (List<Producto>) pm.newQuery(query2).execute();
		String query3 = "select from " + Clasificacion.class.getName();
		List<Clasificacion> listaClasi= (List<Clasificacion>) pm.newQuery(query3).execute();
		String query4 = "select from " + Pedido.class.getName();
		List<Pedido> listas= (List<Pedido>) pm.newQuery(query4).execute();
		req.setAttribute("listas", listas);
		req.setAttribute("listaClasi", listaClasi);
		req.setAttribute("listaPedido", listaPedido);
		req.getRequestDispatcher("/WEB-INF/Views/Pedidos/compras.jsp").forward(req, resp);

	}
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		String res = req.getParameter("productosControl");
		if (res != null ){
			String productoLong = req.getParameter("productosControl");
			String producto = req.getParameter("producto");
			
			
			
			int cantidad = Integer.parseInt(req.getParameter("cantidad"));
			PersistenceManager pm = PMF.get().getPersistenceManager();
			String query = "select from "+Producto.class.getName()+ " where name == '"+producto+"'";
			List<Producto> precioPro = (List<Producto>) pm.newQuery(query).execute();
			
			Pedido pedido = new Pedido(productoLong, producto, cantidad,precioPro.get(0).getpPrecio());
			try{
				pm.makePersistent(pedido);
			} finally {
				resp.sendRedirect("/pedidos");
				pm.close();
			}
		}
		
	}
}	
