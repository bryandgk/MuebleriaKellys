package controller.compras;

import java.io.IOException;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.entity.JuegoDeSala;
import model.entity.Pedido;
import model.entity.SalaComedor;
import model.entity.Vitrina;
import pmf.entity.PMF;
@SuppressWarnings("serial")
public class ControllerIndexCompras extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		String query2 = "select from " + Pedido.class.getName();
		List<Pedido> listaPedido = (List<Pedido>) pm.newQuery(query2).execute();
		req.setAttribute("listaPedido", listaPedido);
		
		req.getRequestDispatcher("/WEB-INF/Views/Pedidos/compras.jsp").forward(req, resp);

	}
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		String res = req.getParameter("producto");
		if (res != null ){
			String producto = req.getParameter("producto");
			int cantidad = Integer.parseInt(req.getParameter("cantidad"));
			PersistenceManager pm = PMF.get().getPersistenceManager();
			Pedido pedido = new Pedido(producto, cantidad, cantidad*10);
			try{
				pm.makePersistent(pedido);
			} finally {
				
				resp.sendRedirect("/pedidos");
				pm.close();
			}
		}
		
	}
}	
