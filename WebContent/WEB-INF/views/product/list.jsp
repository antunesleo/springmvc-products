<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
	<title>Lista de produtos</title>
	      <!--Import Google Icon Font-->
      <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
      <!--Import materialize.css-->
      <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/materialize.min.css"  media="screen,projection"/>
	   <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css"/>
      <!--Let browser know website is optimized for mobile-->
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
</head>
<body>
	<c:import url="../resources/header.jsp" />
	<div class="container">
		<div class="row">
			<br />
			<a href="newProduct" class="waves-effect waves-light btn"><i class="material-icons left">input</i>Nova tarefa</a>
		</div>
		<div class="row">
			<table class="bordered striped responsive-table">
				<thead>
					<tr>
						<th>ID</th>
						<th>Descrição</th>
						<th>Nome</th>
						<th>Manufaturado</th>
						<th>Und. por pallet</th>
						<th>Dias de garantia</th>
						<th>Und. de medida</th>
						<th>Vendido</th>
						<th>Discontinuado</th>
						<th>Preço</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${products}" var="product">
					<tr>
						<td>${product.id}</td>
						<td>${product.description}</td>
						<td>${product.name}</td>
						<c:if test="${product.manufactured eq false}">
							<td>Não</td>
						</c:if>
						<c:if test="${product.manufactured eq true }">
							<td>Sim</td>
						</c:if>
						<td>${product.untPerPallet}</td>
						<td>${product.guaranteeDays}</td>
						<td>${product.uom}</td>
						<c:if test="${product.sold eq false}">
							<td>Não</td>
						</c:if>
						<c:if test="${product.sold eq true }">
							<td>Sim</td>
						</c:if>
						<c:if test="${product.discontinued eq false}">
							<td>Não</td>
						</c:if>
						<c:if test="${product.discontinued eq true }">
							<td>Sim</td>
						</c:if>
						<td>${product.price}</td>
						<td><a href="mostraTarefa?id=${product.id}"><i class="material-icons left">delete</i></a></td>
						<td><a href="removeTarefa?id=${product.id}"><i class="material-icons left">edit</i></a></td>
					</tr>	
				</c:forEach>
				</tbody>
		
			</table>
		</div>
	</div>
	<c:import url="../resources/footer.jsp"></c:import>
	<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/materialize.min.js"></script>
</body>
</html>