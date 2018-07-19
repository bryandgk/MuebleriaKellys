<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="model.entity.Facturar"%>
<%@ page import="model.entity.Pedido"%>
<%@ page import="com.google.appengine.api.users.User"%>
<%@ page import="com.google.appengine.api.users.UserService"%>
<%@ page import="com.google.appengine.api.users.UserServiceFactory"%>
<%
	List<Facturar> listas = (List<Facturar>) request.getAttribute("listas");
	List<Pedido> listaPedido = (List<Pedido>) request.getAttribute("listaPedido");
	UserService us = UserServiceFactory.getUserService();
	User user = us.getCurrentUser();
	SimpleDateFormat sdf = new SimpleDateFormat("M/d/yyyy");
%>


<!DOCTYPE html>
<html lang="en">
<head>
<title>CRUD DEMO</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/CSS/estilo.css">
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
				<a class="navbar-brand" href="/principal">Muebleria Kelly</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#iconosDeBarra">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="iconosDeBarra">
					<!-- Links -->
					<ul class="navbar-nav mr-auto mt-2 mt-lg-0">

						<!-- Dropdown -->

						<li class="nav-item"><a class="nav-link" href="/roles">Roles</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="/users">Usuarios</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="/resources">Recursos</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="/access">Accesos</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="/productos">Productos</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="/clasificaciones">Clasificaciones</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="/proformas">Proformas</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="/facturas">Factura</a>
						</li>
					</ul>
				</div>
				<div class="form-inline my-2 my-lg-0">
					<a class="btn btn-dark" href="/pedidos" title="Carrito de Compras"><i
						class="fas fa-shopping-cart"></i></a>
					<ul class="navbar-nav">
						<li class="nav-item dropdown"><a
							class="btn btn-dark nav-link mr-sm-2 dropdown-toggle"
							data-toggle="dropdown" href="#"><i class="far fa-user"></i> <%=user.getEmail()%></a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="/sesion/logout">Logout</a>
							</div></li>
					</ul>
				</div>
			</div>
		</nav>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-md-3 p-4">
				<div class="mx-auto">
					<a class="btn btn-success" href="/facturas/add">Add New Product</a>
				</div>
			</div>
			<div class="vista col-md-9">

				<h1 class="font-italic">Facturas</h1>
				<div class="form-control">
					<%
						if (!listas.isEmpty() && listas.size() > 0) {
					%>
					<h2>
						Factura #ID:
						<%=listas.get(0).getId()%></h2>
					<a class="btn btn-success float-right" href="/imprimir">Emitir
						Factura</a>
					<table class="table">
						<thead>
							<tr>
								<th>n°</th>
								<th>Codigo Producto</th>
								<th>Cantidad</th>
								<th>Descripción</th>
								<th>Precio/unidad</th>
								<th>total</th>
								<th>Acciones</th>
							</tr>
						</thead>
						<%
							float sumTotal = 0;
								for (int i = 0; i < listas.size(); i++) {
									Facturar o = (Facturar) listas.get(i);
						%>
						<tbody>
							<tr>
								<td><%=i + 1%></td>
								<td><%=o.getCodigoPro()%></td>
								<td><%=o.getCantidad()%></td>
								<td><%=o.getDescripcion()%></td>
								<td><%=o.getPrecioUnidad()%></td>
								<td><%=o.getTotal()%></td>
								<td><span><a
										href="/facturas/view?facturasId=<%=o.getId()%>">View</a></span> <span><a
										href="/facturas/delete?facturasId=<%=o.getId()%>">Delete</a></span> <span><a
										href="/facturas/update?facturasId=<%=o.getId()%>">Update</a></span></td>
							</tr>
						</tbody>
						<%
							sumTotal = sumTotal + o.getTotal();
								}
						%>
					</table>

					<div class="muestraTotal">
						<h2>
							Importe Total:
							<%=sumTotal%></h2>
					</div>
					<%
						}
					%>
				</div>
				<div class="form-control">
					<%
						if (listaPedido.size() > 0) {
					%>
					<h1>
						Factura #ID:
						<%=listaPedido.get(0).getId()%></h1>
					<table class="table">
						<thead>
							<tr>
								<th>n°</th>
								<th>Codigo Producto</th>
								<th>Cantidad</th>
								<th>Descripción</th>
								<th>Precio/unidad</th>
								<th>total</th>
								<th>Acciones</th>
							</tr>
						</thead>
						<%
							for (int i = 0; i < listaPedido.size(); i++) {
									Pedido o = (Pedido) listaPedido.get(i);
						%>
						<tbody>
							<tr>
								<td><%=i + 1%></td>
								<td><%="PXQQQQ01"%></td>
								<td><%=o.getCantidad()%></td>
								<td><%=o.getNameProducto()%></td>
								<td><%=o.getPrecio()%></td>
								<td><%=o.getCantidad()*o.getPrecio()%></td>
								<td><span><a
										href="/facturas/view?facturasId=<%=o.getId()%>">View</a></span> <span><a
										href="/facturas/delete?facturasId=<%=o.getId()%>">Delete</a></span> <span><a
										href="/facturas/update?facturasId=<%= o.getId() %>">Update</a></span>
								</td>
							</tr>
						</tbody>
						<%
							}
						%>
						<a class="btn btn-success float-right" href="/imprimir">Emitir
							Factura</a>
					</table>

					<%} %>
				</div>
			</div>
		</div>
	</div>
</body>
</html>