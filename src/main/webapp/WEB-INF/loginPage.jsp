<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
	<%@ include file="partials/meta.jsp" %>
	<%@ include file="partials/header.jsp" %>  
</head>
<body>
	<%@ include file="partials/bsNavbar.jsp" %>
	
	<c:if test="${errorMessage != null}">			
		<div class="alert alert-danger" role="alert">
		  <span class="fa fa-exclamation-triangle" aria-hidden="true"></span>
		  <span class="sr-only">Error:</span>	  
		  <c:out value="${errorMessage}"></c:out>
		</div>
	</c:if>
							
	<c:if test="${logoutMessage != null}">				
		<div class="alert alert-success" role="alert">
		  <span class="fa fa-check-circle" aria-hidden="true"></span>  
		  <!-- <span class="sr-only">Error:</span> -->	  
		  <c:out value="${logoutMessage}"></c:out>
		</div>	
    </c:if>
    
	<div class="container center_div">
	    <h1 class="display-4">Login</h1>			
		<form action="/login" method="POST">
		  <div class="form-group col-5">
		    <label for="username">Username</label>
		    <input type="text" class="form-control" id="username" name="username" aria-describedby="usernameHelp" placeholder="Enter username">
		    <small id="usernameHelp" class="form-text text-muted">Username should be 8-10 char long.</small>
		  </div>
		  <div class="form-group col-5">
		    <label for="password">Password</label>
		    <input type="password" class="form-control" id="password" name="password" placeholder="Enter Password">
		  </div>		
		  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		  <button type="submit" class="btn btn-primary btn-sm btn_size">Login</button>		  		  
		</form>		
	</div>
	
	<%@ include file="partials/footer.jsp" %>	

</body>
</html>