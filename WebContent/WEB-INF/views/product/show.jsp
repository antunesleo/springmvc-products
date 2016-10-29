<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>Nova tarefa</title>
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
	<c:import url="../resources/header.jsp"></c:import>
	<div class="container">
		<h4>Alterar tarefa ID = ${product.id}</h2>
		<div class="row">
	    <form class="col s12" method="post" action="updateProduct">
	    	<input type="hidden" name="id" value="${product.id}" />
	      <div class="row">
	        <div class="input-field col s6">
	          <input id="name" name="name" type="text" class="validate" value="${product.name}">
	          <label for="name">Nome</label>
	        </div>

			  <div class="input-field col s6">
			    <select name="uom">
					<option value="product.uom">${product.uomName}</option>
					<c:forEach items="${uomDao.getList(true)}" var="uom">
						<option value ="uom.id">${uom.name}</option>
					</c:forEach>
				</select>
			  </div>
	      </div>
	      <div class="row">
          	<div class="input-field col s12">
         		<textarea id="description" name="description" class="materialize-textarea">
         			${product.description}
         		</textarea>
         	    <label for="description">Descri��o</label>
            </div>
          </div>
          <div class="row">
	          <c:choose>
	          	<c:when test="${product.active==true}">
	          		<div class="input-field col s6	 m3">
	      				<input type="checkbox" class="filled-in" id="active" name="active" checked/>
	     				<label for="active">Ativo</label>
					</div>
	          	</c:when>
	          	<c:otherwise>
	          	    <div class="input-field col s6	 m3">
	      				<input type="checkbox" class="filled-in" id="active" name="active"/>
	     				<label for="active">Ativo</label>
					</div>
	          	</c:otherwise>
	          </c:choose>
	          
	          <c:choose>
	          	<c:when test="${product.sold==true}">
					<div class="input-field col s6 m3">
		      				<input type="checkbox" class="filled-in" id="sold" name="sold" checked/>
		     				<label for="sold">Vendido</label>
					</div>
	          	</c:when>
	          	<c:otherwise>
					<div class="input-field col s6 m3">
		      				<input type="checkbox" class="filled-in" id="sold" name="sold"/>
		     				<label for="sold">Vendido</label>
					</div>
	          	</c:otherwise>
	          </c:choose>
	
	          <c:choose>
	          	<c:when test="${product.manufactured==true}">
					<div class="input-field col s6 m3">
		      				<input type="checkbox" class="filled-in" id="manufactured" name="manufactured" checked/>
		     				<label for="manufactured">Produzido</label>
					</div>
	          	</c:when>
	          	<c:otherwise>
					<div class="input-field col s6 m3">
		      				<input type="checkbox" class="filled-in" id="manufactured" name="manufactured"/>
		     				<label for="manufactured">Produzido</label>
					</div>
	          	</c:otherwise>
	          </c:choose>
	          
	          <c:choose>
	          	<c:when test="${product.discontinued==true}">
					<div class="input-field col s6 m3">
		      				<input type="checkbox" class="filled-in" id="discontinued" id="discontinued" checked="${product.discontinued}"/>
		     				<label for="discontinued">Discontinued</label>
					</div>
	          	</c:when>
	          	<c:otherwise>
					<div class="input-field col s6 m3">
		      				<input type="checkbox" class="filled-in" id="discontinued" id="discontinued"/>
		     				<label for="discontinued">Discontinued</label>
					</div>
	          	</c:otherwise>
	          </c:choose>
          </div>
          <div class="row">
	        <div class="input-field col s6 m6">
	          <input id="price" name="price"type="number" step="any" class="validate" value="${product.price}">
	          <label for="price">Pre�o</label>
	        </div>
	      </div>
	      <div class="row">
	        <div class="input-field col s6 m6">
	          <input id="untPerPallet" name="untPerPallet" type="number" class="validate" value="${product.untPerPallet}">
	          <label for="untPerPallet">Und por pallet</label>
	        </div>
	      <div class="input-field col s6 m6">
	          <input id="guaranteeDays" name="guaranteeDays" type="number" class="validate" value="${product.guaranteeDays}">
	          <label for="guaranteeDays">Dias de garantia</label>
	        </div>
	      </div>
	     <div class="row">
	     	<div class="input-field col s12">
	     	 <button class="btn waves-effect waves-light" type="submit" name="action">Enviar
    			<i class="material-icons right">send</i>
  			 </button>
	     	</div>
	     </div>
	    </form>
	  </div>
	</div>
	<c:import url="../resources/footer.jsp"></c:import>
	<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/materialize.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/myjs.js"></script>
</body>
</html>