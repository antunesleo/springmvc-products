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
	   <link type="text/css" rel="stylesheet" href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css"/>
      <!--Let browser know website is optimized for mobile-->
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
      <meta name="theme-color" content="#37474f" />
</head>
<body>
	<c:import url="../resources/header.jsp" />
	<div class="container">
		<p>Exemplo com o data table</p>
		<div class="row">
			<div class="col s12 m12">
				<table id="example" class="display" cellspacing="0" width="100%">
        <thead>
            <tr>
                <th>Id</th>
                <th>nome</th>
                <th>Preço</th>
                <th>Garantia</th>
                <th>Und por Pallet</th>
                <th>Manufaturado</th>
                <th>Descontinuado</th>
                <th>Vendido</th>
            </tr>
        </thead>
   		<tbody>
   			<tr>
   				<c:forEach items="${products}" var="product">
   					<td>${product.id}</td>
   					<td>${product.name}</td>
   					<td>${product.price}</td>
   					<td>${product.guaranteeDays}</td>
   					<td>${product.untPerPallet}</td>
   					<td>${product.manufactured}</td>
   					<td>${product.discontinued}</td>
   					<td>${product.sold}</td>
   				</c:forEach>
   			</tr>
        </tbody>
    </table>
			</div>
		</div>
	</div>
	<div class="container">
		<br />
		<div class="row">
			<div class="col s12 m12">
				<display:table name="${products}" id="product" class="responsive-table highlight striped" 
					pagesize="5" export="true" sort="list" requestURI = "listProducts" >
					<display:column property="id" title="ID" sortable="true" headerClass="sortable"></display:column>					
					<display:column property="name" title="Nome" sortable="true" headerClass="sortable"></display:column>
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
	<script src="https://code.jquery.com/jquery-3.2.1.js"
  		integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE=" crossorigin="anonymous"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/materialize.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/myjs.js"></script>
</body>
</html>