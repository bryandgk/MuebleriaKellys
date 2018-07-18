package controller.proformas;

import javax.servlet.http.HttpServlet;
import java.util.*;
import java.io.IOException;  


import javax.jdo.PersistenceManager;

import javax.servlet.*;  
import javax.servlet.http.*;

import pmf.entity.*;
import model.entity.Access;
import model.entity.Producto;
import model.entity.Proforma;
import model.entity.Resources;
import model.entity.User;  
import com.google.appengine.api.users.UserServiceFactory;

@SuppressWarnings("serial")
public class ProformasControllerAdd extends HttpServlet{
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		com.google.appengine.api.users.User uGoogle =UserServiceFactory.getUserService().getCurrentUser();
		String error;
		if(uGoogle==null){
			RequestDispatcher dp= getServletContext().getRequestDispatcher("/WEB-INF/Views/Errors/error5.jsp");
			dp.forward(request, response);
		}
		else{
			PersistenceManager accesoControlador=PMF.get().getPersistenceManager();
			String qUsers="select from "+ User.class.getName()+" where email=='"+uGoogle.getEmail()+"' && status==true";
			List<User> uSearch=(List<User>) accesoControlador.newQuery(qUsers).execute();
			if(uSearch.isEmpty()){
				error = "usuario no registrado";
				request.setAttribute("error", error);
				RequestDispatcher dp= getServletContext().getRequestDispatcher("/WEB-INF/Views/Errors/error5.jsp");
				dp.forward(request, response);
			}else{
				String query2="select from "+ Resources.class.getName()
						+" where url == '"+request.getServletPath()+"' && status==true";
				List <Resources> rSearch=(List<Resources>) accesoControlador.newQuery(query2).execute();
				if(rSearch.isEmpty()){
					error = "recurso no registrado";
					request.setAttribute("error", error);
					RequestDispatcher dp= getServletContext().getRequestDispatcher("/WEB-INF/Views/Errors/error5.jsp");
					dp.forward(request, response);
				}
				else{
					String query3 = "select from "+Access.class.getName()
							+" where idRol == "+uSearch.get(0).getIdRole()+" && resource== '"+rSearch.get(0).getName()+"' && status==true";	
					List <Access> aSearch=(List<Access>) accesoControlador.newQuery(query3).execute();		
					if(aSearch.isEmpty()){
						error = "no se registro el acceso";
						request.setAttribute("error", error);
						RequestDispatcher dp= getServletContext().getRequestDispatcher("/WEB-INF/Views/Errors/error5.jsp");
						dp.forward(request, response);
					}else{
						request.getRequestDispatcher("/WEB-INF/Views/proformas/add.jsp").forward(request, response);;
					}

				}
			}
		}



	}

	@SuppressWarnings("unchecked")
	protected void doPost(HttpServletRequest request, HttpServletResponse response)   
			throws ServletException, IOException {


		boolean existe = false;
		String res = request.getParameter("name");
		if(res!=null){ 


			String name=request.getParameter("name");  
			String direc=request.getParameter("direccion");
			String telefono=request.getParameter("telefono");
			int cant=Integer.parseInt(request.getParameter("cantidad"));


			Producto unico= new Producto("Mesa",15.0);
			double pTotal=cant*unico.getpPrecio();

			PersistenceManager pm = PMF.get().getPersistenceManager();

			String query = "select  from " + Proforma.class.getName();
			List<Proforma> listas = (List<Proforma>) pm.newQuery(query).execute();



			for(Proforma c : listas){
				if(c.getName().equals(name))
					existe=true;
			}

			if(!existe){
				Proforma nuevo= new Proforma(name, direc, telefono, cant);  
				nuevo.settPrecio(pTotal);
				nuevo.setIGV(0.18*pTotal);


				try{
					pm.makePersistent(nuevo);
					response.sendRedirect("/proformas");

				}
				finally {
					pm.close();
				}


			}

		}

	}
}

