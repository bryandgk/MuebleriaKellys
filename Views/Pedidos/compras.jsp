<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="model.entity.Pedido"%>
<%@page import="model.entity.Clasificacion"%>
<%@page import="model.entity.Producto"%>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%
	UserService us = UserServiceFactory.getUserService();
	User user = us.getCurrentUser();
	List<Clasificacion> listaClasi = (List<Clasificacion>) request.getAttribute("listaClasi");
	List<Producto> listaPedido = (List<Producto>) request.getAttribute("listaPedido");
	List<Pedido> listas= (List<Pedido>) request.getAttribute("listas");
%>
<!DOCTYPE html>
<html>
<head>
	<title>Muebleria Kelly's</title>
	<meta charset="utf-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
  	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
  	<script language="javascript" type="text/javascript">
	$(document).ready(function(){
    $(".formula").hide();
    $("#productosControl").change(function(){
    	$(".formula").hide();
        $("#clasi" + $(this).val()).show();
    });
});
</script>
</head>
<body>
	<div class="cabeza">
		<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
			<div class="container">
				<!-- Brand -->
				<a class="navbar-brand" href="/principal">Muebleria Kelly</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#iconosDeBarra">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="iconosDeBarra">
				<!-- Links -->
				<ul class="navbar-nav mr-auto mt-2 mt-lg-0">

					<!-- Dropdown -->
					
					<li class="nav-item">
						<a class="nav-link" href="/roles">Roles</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="/users">Usuarios</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="/resources">Recursos</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="/access">Accesos</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="/productos">Productos</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="/clasificaciones">Clasificaciones</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="/proformas">Proformas</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="/facturas">Factura</a>
					</li>
				</ul>
				</div>
				<div class="form-inline my-2 my-lg-0">
					<a class="btn btn-dark" href="/pedidos" title="Carrito de Compras"><i class="fas fa-shopping-cart"></i></a>
					<ul class="navbar-nav">
						<li class="nav-item dropdown">
							<a class="btn btn-dark nav-link mr-sm-2 dropdown-toggle" data-toggle="dropdown" href="#"><i class="far fa-user"></i> <%=user.getEmail() %></a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="/sesion/logout">Logout</a>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</nav>
	</div>	
	<div class="container">
		<div class="row">
			<div class="col-xs-3 p-4">
				<a class="btn btn-success" href="/principal">regresar a inicio</a>
			</div>
			<div class="col-xs-9 p-4">
				<form class="form-group" action="/pedidos" method="post"> 
				
					<h1 class="font-italic">Seleccione sus productos</h1>
					<select  id="productosControl" class="form-control form-group" name="productosControl">
						<% 
							for (int i =0 ; i<listaClasi.size(); i++){ 
								Clasificacion clasi = listaClasi.get(i);		
						%>
								<option value="<%= clasi.getId() %>"><%= clasi.getName() %></option>
						<%  }  %>
					</select>
					
					<%
						for(int k = 0 ; k<listaClasi.size(); k++){
					%>
					<div id="clasi<%=listaClasi.get(k).getId() %>" class="formula"  style="display:none;">
					<h3 class="font-italic">Productos</h3>
					<select  class="form-control form-group" name="producto" >
						<% 
							for (int i =0 ; i<listaPedido.size(); i++){ 
								Producto pro = listaPedido.get(i);
								if(listaClasi.get(k).getId().equals(listaPedido.get(i).getClasificacion())){
						%>
								<option><%= pro.getName() %></option>
						<%  
								}	
							}  
						%>
					</select>
					</div>
					<%
						}
					%> 	
					
					<h2 class="font-italic">Cantidad</h2>
					<select class="form-control form-group" name="cantidad" id="cantidad">
						<% for(int i=1 ; i<=10 ;i++){ %>
							<option><%=i %></option>
						<% } %>
					</select>
					
					<input class="btn btn-success" type="submit" name="enviar" value="Añadir Producto">
		
				</form>
				
				
				
				
				<div class="jumbotron">
					<h2 class="font-italic">Lista de Productos</h2>
					
					<%if (listas.size()>0){ %>
					<table class="table table-dark table-striped">
						<thead>
							<tr>
								<th>N°</th>
								<th>Cantidad</th>
								<th>Producto</th>
								<th>Precio</th>
							</tr>
						</thead>
						<tbody>
							<% for (int i = 0 ; i<listas.size(); i++) {
									Pedido pedido = listas.get(i);
							%>
							<tr>
								<td><%=(i+1) %></td>
								<td><%= pedido.getCantidad()%></td>
								<td><%= pedido.getNameProducto() %></td>		
								<td><%= pedido.getPrecio() %></td>
							</tr>
							<%} %>
						</tbody>
					</table>
					<a class="btn btn-dark float-left" href="/proformas">Emitir Proforma</a>
					<a class="btn btn-dark float-right" href="/facturas">Solicitar Factura</a>
					<%} else { %>
						<h4>No se añadieron Productos Al carrito</h4>
					<%} %>
					<% if(user==null){
							for(int i= 0; i<listas.size(); i++){
								listas.remove(i);
							}
						}%>
					
				</div>
			</div>
		</div>
	</div>
</body>
</html>