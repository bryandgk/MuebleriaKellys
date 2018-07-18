<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@   page import="java.util.List"%>
<%@  page import="model.entity.*"%>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>

<%
	List<SalaComedor> salas = (List<SalaComedor>) request.getAttribute("salas");
	List<JuegoDeSala> juegos = (List<JuegoDeSala>) request.getAttribute("juegos");
	UserService us = UserServiceFactory.getUserService();
	User user = us.getCurrentUser();
	List<Vitrina> vitrinas = (List<Vitrina>) request.getAttribute("vitrinas");
	
%>
<!DOCTYPE html>
<html>
<head>
	<title>CRUD Productos</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
	<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.1.0/css/all.css"
	integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt"
	crossorigin="anonymous">
</head>
<body>
	<div class="cabeza">
		<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
			<div class="container">
				<!-- Brand -->
				<a class="navbar-brand" href="/index.html">Muebleria Kelly</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#iconosDeBarra">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="iconosDeBarra">
				<!-- Links -->
				<ul class="navbar-nav mr-auto mt-2 mt-lg-0">

					<!-- Dropdown -->
					<li class="nav-item">
						<a class="nav-link" href="">Nosotros</a>
					</li>
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
						<a class="nav-link" href="/product">Productos</a>
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
			<div class="col-md-3 p-4">
				<div class="mx-auto">
					<a class="btn btn-success" href="/product/add">Agregar Producto</a>
				</div>
			</div>
			<div class="col-md-9 p-4">
				<h1>Lista de Productos</h1>
				
				<h3>Sala Comedor</h3>
				<%
					if (salas.size() != 0) {
				%>
				<table class="table">
					<thead>
					<tr>
						<th>Nº</th>
						<th>Alto</th>
						<th>Ancho</th>
						<th>Precio</th>
						<th>Vidrio</th>
						<th>Nº sillas</th>
						<th>Opciones</th>
					</tr>
					</thead>
					<%
						for (int i = 0; i < salas.size(); i++) {
							SalaComedor o = (SalaComedor) salas.get(i);
					%>
					<tbody>
					<tr>

						<td ><%=i + 1%></td>
						<td ><%=o.getHeigh()%></td>
						<td ><%=o.getWidth()%></td>
						<td ><%=o.getPrice()%></td>
						<td >
							<%
						if (o.hasGlass()) {
					%>Si<%
						} else {
					%>No<%
						}
					%>
						</td>
						<td ><%=o.getNumOfChairs()%></td>
						<td><span><a
								href="/product/delete?ti=1&ProductId=<%=o.getId()%>">Delete</a></span>
							<span><a
								href="/product/update?ti=1&ProductId=<%=o.getId()%>">Update</a></span></td>
					</tr>
					</tbody>
					<%
				}
			%>
				</table>
			<%
				} else {
			%>
				<h3>No hay productos para mostrar</h3>
			<%
				}
			%>
			
			<h3>Juego de sala</h3>
			<%
			if (juegos.size() != 0) {
		%>
		<table class="table">
			<thead>
			<tr>
				<th>Nº</th>
				<th>Alto</th>
				<th>Ancho</th>
				<th>Precio</th>
				<th>Vidrio</th>
				<th>Nº sillas</th>
				<th>Opciones</th>
			</tr>
			</thead>
			<%
				for (int i = 0; i < juegos.size(); i++) {
						JuegoDeSala o = (JuegoDeSala) juegos.get(i);
			%>
			<tbody>
			<tr>
				<td ><%=i + 1%></td>
				<td ><%=o.getHeigh()%></td>
				<td ><%=o.getWidth()%></td>
				<td ><%=o.getPrice()%></td>
				<td >
					<%
						if (o.hasGlass()) {
					%>Si<%
						} else {
					%>No<%
						}
					%>
				</td>
				<td ><%=o.getNumOfChairs()%></td>
				<td ><span><a
						href="/product/delete?ti=2&ProductId=<%=o.getId()%>">Delete</a></span> <span><a
						href="/product/update?ti=2&Num=<%=i%>&ProductId=<%=o.getId()%>">Update</a></span></td>
			</tr>
			</tbody>
			<%
				}
			%>
		</table>
		<%
			} else {
		%>
			<h3>No hay productos para mostrar</h3>
		<%
			}
		%>
			<h2>Vitrinas</h2>
		<%
			if (vitrinas.size() != 0) {
		%>
		<table class="table">
			<thead>
			<tr>
				<th>Nº</th>
				<th>Alto</th>
				<th>Ancho</th>
				<th>Precio</th>
				<th>Vidrio</th>
				<th>Nº de piezas</th>
				<th>Opciones</th>
			</tr>
			</thead>
			<%
				for (int i = 0; i < vitrinas.size(); i++) {
						Vitrina o = (Vitrina) vitrinas.get(i);
			%>
			<tbody>
			<tr >
				<td><%=i + 1%></td>
				<td><%=o.getHeigh()%></td>
				<td><%=o.getWidth()%></td>
				<td><%=o.getPrice()%></td>
				<td>
					<%
						if (o.hasGlass()) {
					%>Si<%
						} else {
					%>No<%
						}
					%>
				</td>
				<td ><%=o.getNumOfPieces()%></td>
				<td ><span><a
						href="/product/delete?ti=3&ProductId=<%=o.getId()%>">Delete</a></span> <span><a
						href="/product/update?ti=3&Num=<%=i%>&ProductId=<%=o.getId()%>">Update</a></span></td>
			</tr>
			</tbody>
			<%
				}
			%>
		</table>
		<%
			} else {
		%>
		<h3>No hay productos para mostrar</h3>
		<%
			}
		%>
				
			</div>
		</div>
	</div>
</body>
</html>