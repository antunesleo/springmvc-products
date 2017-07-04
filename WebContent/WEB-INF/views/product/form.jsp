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
		<div class="row">
	    <form class="col s12" method="post" action="addProduct">
	      <div class="row">
	        <div class="input-field col s6">
	          <input id="name" name="name" type="text" class="validate">
	          <label for="name">Nome</label>
	        </div>
	        <div class="input-field col s6">
	           <select id="categorie" name="categorie">
			      <option value="" disabled selected>Selecione a categoria</option>
			      <c:forEach items="${categories}" var="categorie">
			          <option value="${categorie.id}"> ${categorie.name} </option>
			      </c:forEach>
    			</select>
	        </div>
	      </div>
	      <div class="row">
          	<div class="input-field col s12">
         		<textarea id="description" name="description" class="materialize-textarea"></textarea>
         	    <label for="description">Descrição</label>
            </div>
          </div>
          <div class="row">
			<div class="input-field col s6	 m3">
      				<input type="checkbox" class="filled-in" id="active" name="active"/>
     				<label for="active">Ativo</label>
			</div>
          </div>
          <div class="row">
	        <div class="input-field col s6 m6">
	          <input id="price" name="price"type="number" step="any" class="validate">
	          <label for="price">Preço</label>
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
    	<script>
		$(document).ready(function() {
		    $('select').material_select();
		});
	</script>
</body>
</html>