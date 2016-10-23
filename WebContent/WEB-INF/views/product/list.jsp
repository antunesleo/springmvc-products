<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
	<title>Lista de produtos</title>
</head>
<body>
	<a href="newProduct">Nova tarefa</a>
	<br /><br />
	<table>
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
				<td><a href="mostraTarefa?id=${product.id}">Alterar</a></td>
				<td><a href="removeTarefa?id=${product.id}">Remover</a></td>
			</tr>	
		</c:forEach>

	</table>
</body>
</html>