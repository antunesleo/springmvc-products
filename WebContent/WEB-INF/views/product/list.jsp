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
		<div class="row  top-grid">
			<div class="col s3 m3">
				<h5>Product list</h5>
			</div>
			<div class="col s9 m9">
				<a class="waves-effect waves-light btn add-button" id="newProduct" href="newProduct" >add</a>
			</div>
		</div>
		<div class="row">
			<div class="col s12 m12">
				<table id="example" class="display" cellspacing="0" width="100%">
			        <thead>
			            <tr>
			                <th>Id</th>
			                <th>nome</th>
			                <th>Preço</th>
			                <th>Ativo</th>
			                <th>Categoria</th>
			                <th>Ações</th>
			            </tr>
			        </thead>
			   		<tbody>
			   			<c:forEach items="${products}" var="product">
			   				<tr>
			   					<td>${product.id}</td>
			   					<td>${product.name}</td>
			   					<td>${product.price}</td>
				   				<c:choose>
							       <c:when test="${product.active==true}"> <td>Sim</td> </c:when>
							       <c:otherwise><td>Não</td></c:otherwise>
							    </c:choose>
							    <td>${product.categorie.name}</td>
							    <td>
								    <a href="showProduct?id=${product.id}"><i class="material-icons left">edit</i></a>
									<a href="removeProduct?id=${product.id}"><i class="material-icons left">delete</i></a>
							    </td>
			   				</tr>
			   			</c:forEach>
			        </tbody>
    			</table>
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