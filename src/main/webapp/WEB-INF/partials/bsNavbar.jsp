<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<nav class="navbar navbar-expand-md navbar-light bg-light fixed-top">
  <a class="navbar-brand" href="/index"><span class="fa fa-home" aria-hidden="true"></span> OOSH</a>
  
  <div class="collapse navbar-collapse" id="navbarsExampleDefault">
  
    <ul class="navbar-nav mr-auto">    
 		
    </ul>
	<div class="pull-right">
        <ul class="nav navbar-nav">
       
     	 <c:if test="${currentUser != ''}">
		    <li class="nav-item dropdown">
		   	<a class="nav-link dropdown-toggle" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><c:out value="${currentUser}"></c:out></a>
		   <div class="dropdown-menu" aria-labelledby="dropdown01">
		     <a class="dropdown-item" href="#">My Orders</a>
		     <c:if test="${currentUserRole == 'admin'}">
		     <a class="dropdown-item" href="#">Manage Orders</a>
		     <a class="dropdown-item" href="#">Manage Products</a>	
		     </c:if>	
		     <form id="logoutForm" method="POST" action="/logout">
	        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>	   
	        	<!-- <span class="fa fa-arrow-circle-left" aria-hidden="true"></span> -->      	
	        	<button type="submit" class="dropdown-item btn logoutBtn" name="logout" id="logout"  value="Log Out">Log Out</button>
			  </form>      
		   </div>
		 </li>      
		</c:if>
		<c:if test="${currentUser == ''}">				
		 	 <li class="nav-item">		 	 
		       <a class="nav-link" href="/login"><span class="fa fa-user" aria-hidden="true"></span> Login</a>
		     </li>   
		     <li class="nav-item">		     	
		       <a class="nav-link" href="/registration"><span class="fa fa-user-plus" aria-hidden="true"></span> Register</a>
		     </li>  		     
		</c:if>	
		
   		<li class="nav-item">
        	<a class="nav-link" href="/shoppingCart"><span class="fa fa-cart-plus" aria-hidden="true"></span> Shopping Cart</a>
     	 </li> 
     	 
        </ul>     
	</div>
  </div>
</nav>