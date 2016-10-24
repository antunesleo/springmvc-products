<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="display" uri="http://displaytag.sf.net" %>

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
      <meta name="theme-color" content="#37474f" />
</head>
<body>
	<c:import url="../resources/header.jsp" />
	<div class="container">
		<br />
		<div class="row">
			<div class="col s12 m12">
				<!--  normal table 
				<table class="bordered striped responsive-table">
					<thead>
						<tr>
							<th>ID</th>
							<th>Descrição</th>
							<th>Nome</th>
							<th>Und. por pallet</th>
							<th>Dias de garantia</th>
							<th>Und. de medida</th>
							<th>Vendido</th>
							<th>Discontinuado</th>
							<th>Manufaturado</th>
							<th>Active</th>
							<th>Preço</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${products}" var="product">
						<tr>
							<td>${product.id}</td>
							<td>${product.description}</td>
							<td>${product.name}</td>
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
							
							<c:if test="${product.active eq false}">
								<td>Não</td>
							</c:if>
							<c:if test="${product.active eq true }">
								<td>Sim</td>
							</c:if>
							
							<td>${product.price}</td>
							<td><a href="showProduct?id=${product.id}"><i class="material-icons left">edit</i></a></td>
							<td><a href="removeProduct?id=${product.id}"><i class="material-icons left">delete</i></a></td>
						</tr>	
					</c:forEach>
					</tbody>
				</table>
				-->
				<display:table name="${products}" id="product" class="responsive-table highlight" 
					pagesize="5" export="true" sort="list" requestURI = "listProducts" >
					<display:column property="id" title="ID" sortable="true" headerClass="sortable"></display:column>					
					<display:column property="name" title="Nome" sortable="true" headerClass="sortable"></display:column>
					<display:column property="uom" title="Und de medida" sortable="true" headerClass="sortable"></display:column>
					<display:column property="price" title="Preço" sortable="true" headerClass="sortable"></display:column>
					<display:column property="guaranteeDays" title="Garantia (dias)" sortable="true" headerClass="sortable"></display:column>
					<display:column property="untPerPallet" title="Und por pallet" sortable="true" headerClass="sortable"></display:column>
					<display:column title="Manufaturado" sortable="true" headerClass="sortable">
						<c:if test="${product.manufactured eq false}">
							Não
						</c:if>
						<c:if test="${product.manufactured eq true }">
							Sim
						</c:if>
					</display:column>
					<display:column title="Discontinuado" sortable="true" headerClass="sortable">
						<c:if test="${product.discontinued eq false}">
							Não
								</c:if>
								<c:if test="${product.discontinued eq true }">
							Sim
						</c:if>
					</display:column>
					<display:column title="Vendido" sortable="true">
						<c:if test="${product.sold eq false}">
							Não
						</c:if>
						<c:if test="${product.sold eq true }">
							Sim
						</c:if>
					</display:column>
					<display:column ><a href="showProduct?id=${product.id}"><i class="material-icons left">edit</i></a></display:column>
					<display:column ><a href="removeProduct?id=${product.id}"><i class="material-icons left">delete</i></a></display:column>
				</display:table>
			</div>
		</div>
		<div class="row">
			<div class="col s12 m12">
				<br />
				<a href="newProduct" class="waves-effect waves-light btn"><i class="material-icons left">input</i>Novo produto</a>
				<br />
			</div>
		</div>
	</div>
	<c:import url="../resources/footer.jsp"></c:import>
	<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/materialize.min.js"></script>
</body>
</html>