package controller.access;

import java.io.IOException;
import java.util.List;

import javax.jdo.JDOObjectNotFoundException;
import javax.jdo.PersistenceManager;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.users.UserServiceFactory;

import model.entity.Access;
import model.entity.Role;
import model.entity.Users;
import pmf.entity.PMF;
@SuppressWarnings("serial")
public class AccessControllerDelete extends HttpServlet{
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		Key k = KeyFactory.createKey(Access.class.getSimpleName(), new Long(req.getParameter("userId")).longValue());
		
		com.google.appengine.api.users.User uGoogle =UserServiceFactory.getUserService().getCurrentUser();
		String adminMaestro = "bryan96.sc@gmail.com";
		String error;
		
		if(uGoogle ==null){
			error = "necesita iniciar sesion.";
			req.setAttribute("error", error);
			req.getRequestDispatcher("/WEB-INF/Views/Errors/error5.jsp").forward(req, resp);
		} else {
			if(!uGoogle.getEmail().equals(adminMaestro)){
				String queryUsers = "select from "+Users.class.getName()+ " where email== '"+uGoogle.getEmail()+"' && status==true";
				List<Users> searchUsers = (List<Users>) pm.newQuery(queryUsers).execute();
				
				if(searchUsers.isEmpty()){
					req.getRequestDispatcher("/WEB-INF/Views/Errors/error2.jsp").forward(req, resp);
				} else {
					String  admin_1="Administrador";
					Long idRoleAdmin = searchUsers.get(0).getIdRole();
					String queryAdmin = "select from "+Role.class.getName()+" where roles== '"+admin_1+"' && status==true";
					List<Role> searchAdmin = (List<Role>) pm.newQuery(queryAdmin).execute();
					boolean entradaAdmin = searchAdmin.get(0).getId().equals(idRoleAdmin);
					if(searchAdmin.isEmpty()){
						error = "No se encuentra administrador";
						req.setAttribute("error", error);
						req.getRequestDispatcher("/WEB-INF/Views/Errors/error5.jsp").forward(req, resp);
					} else {
						if(entradaAdmin){
							try{
								Access us = pm.getObjectById(Access.class,k);
								if(us!=null){
									//Long id = us.getId();
									pm.deletePersistent(us);
									resp.sendRedirect("/access");
									pm.close();
								}
							}catch (JDOObjectNotFoundException e) {
								resp.sendRedirect("/access");
							}
						}
						else{
							error = "no tiene permisos de administrador";
							req.setAttribute("error", error);
							req.getRequestDispatcher("/WEB-INF/Views/Errors/error5.jsp").forward(req, resp);
						}
					}
				}
			} else {
				try{
					Access us = pm.getObjectById(Access.class,k);
					if(us!=null){
						//Long id = us.getId();
						pm.deletePersistent(us);
						resp.sendRedirect("/access");
						pm.close();
					}
				}catch (JDOObjectNotFoundException e) {
					resp.sendRedirect("/access");
				}
			}
		}
	}
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.sendRedirect("/access");
	}
}
