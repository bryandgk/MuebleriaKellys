<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="model.entity.Pedido"%>

<%
	List<Pedido> listaPedido = (List<Pedido>) request.getAttribute("listaPedido");
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
					<li class="nav-item">
						<a class="nav-link" href="/sesion/login">Login</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="/sesion/logout">Logout</a>
					</li> 
				</ul>
				</div>
				<div class="form-inline my-2 my-lg-0">
					<a class="btn btn-dark" href="/pedidos" title="Carrito de Compras"><i class="fas fa-shopping-cart"></i></a>
					<a class="btn btn-dark mr-sm-2" href="/login"><i class="far fa-user"></i> Mi Cuenta</a>
				</div>
			</div>
		</nav>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-xs-3 p-4">
				<a class="btn btn-success" href="/index.html">regresar a inicio</a>
			</div>
			<div class="col-xs-9 p-4">
				<form class="form-group" action="/pedidos" method="post"> 
					<h1 class="font-italic">Seleccione sus productos</h1>
					<select class="form-control form-group" name="producto">
						<option>juegos de sillas</option>
						<option>mesas</option>
						<option>baño</option>
						<option>respotero</option>
					</select>
					<h2 class="font-italic">Cantidad</h2>
					<select class="form-control form-group" name="cantidad">
						<% for(int i=1 ; i<=10 ;i++){ %>
							<option><%=i %></option>
						<% } %>
					</select>
					<input class="btn btn-success" type="submit" name="enviar" value="Añadir Producto">
				</form>
				<div class="jumbotron">
					<h2 class="font-italic">Lista de Productos</h2>
					<%if (listaPedido.size()>0){ %>
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
							<% for (int i = 0 ; i<listaPedido.size(); i++) {
									Pedido pedido = listaPedido.get(i);
							%>
							<tr>
								<td><%=(i+1) %></td>
								<td><%= pedido.getCantidad() %></td>
								<td><%= pedido.getNameProducto() %></td>
								
								<td><%= pedido.getPrecio() %></td>
							</tr>
							<%} %>
						</tbody>
					</table>
					<%} else { %>
						<h4>No se añadieron Productos Al carrito</h4>
					<%} %>
					<a class="btn btn-dark float-right" href="/facturas">Solicitar Factura</a>
				</div>
			</div>
		</div>
	</div>

</body>
</html>