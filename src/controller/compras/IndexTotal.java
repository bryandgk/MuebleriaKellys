package controller.compras;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@SuppressWarnings("serial")
public class IndexTotal extends HttpServlet{
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		req.getRequestDispatcher("/WEB-INF/Views/Login/index.jsp").forward(req, resp);
	}
	public void doPost(HttpServletRequest req, HttpServletResponse resp)   throws IOException, ServletException{
		doGet(req, resp);
		
	}
}
