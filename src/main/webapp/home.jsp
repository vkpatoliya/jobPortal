<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.DB.DBConnect" %>
<%@page import="java.sql.Connection" %>
  <%@page import="com.dao.JobDAO" %>
    <%@page import="com.entity.Jobs" %>
     <%@page import="java.util.List" %>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User : View Jobs</title>
<%@include file="all_component/all_css.jsp" %>
</head>
<body style="background-color: #f0f1f2">

<c:if test="${empty userobj }">
<c:redirect url="login.jsp"></c:redirect>
</c:if>

<%@include file="all_component/navbar.jsp" %>
<div class="container">
<div class="row">
<div class="col-md-12">


<h5 class="text-center text-primary">ALL Jobs</h5>
<c:if test="${not empty succMsg }">
<h4 class="text-center text-danger">${succMsg}</h4>
<c:remove var="succMsg"/>
</c:if> 
<div class="card">
<div class="card-body">



<form class="form-inline" action="more_view.jsp" method="get">
<div class="form-group col-md-5 mt-1">
<h5><b>Location</b></h5>
</div>
<div class="form-group col-md-4 mt-1">
<h5><b>Category</b></h5>
</div>

<div class="form-group col-md-5">


<select name="location" class="custom-select" id="inlineFormCustomSelectPref">
<option selected value="lo">Chose...</option>
<option value="Gujarat">Gujarat</option>
<option value="Odisha">Odisha</option>
<option value="Jarkhand">Jarkhand</option>
<option value="Delhi">Delhi</option>
<option value="Banglore">Banglore</option>
<option value="Hydrabad">Hydrabad</option>
<option value="Channai">Channai</option>
</select>
</div>
<div class="form-group col-md-5">
<select name=category class="custom-select" id="inlineFormCustomSelectPref">
<option selected value="ca">Chose...</option>
<option value="IT">IT</option>
<option value="Devloper">Devloper</option>
<option value="Banking">Banking</option>
<option value="Engineer">Engineer</option>
<option value="Teacher">Teacher</option>

</select>
</div>
<button class="btn btn-success">Submit</button>

</form>
</div>
</div>
<%
JobDAO dao = new JobDAO(DBConnect.getConn());
List<Jobs> list = dao.getAllJobsForUser();
for(Jobs j :list){
%>
<div class="card mt-2">
<div class="card-body">

<div class="text-center text-primary">
<i class="far fa-clipboard fa-2x"></i>
</div>

<h6><b><%=j.getTitle() %></b></h6>
<%
if(j.getDescription().length() > 0&&j.getDescription().length() < 120 ){
%>
<p><%=j.getDescription()%></p>.
<%
} else {
%>
<p><%=j.getDescription().substring(0,120) %>...
</p>
<%
} 
%>



<br>
<div class="form-row">
<div class="form-group col-md-3">

<input class="form-control form-control-sm"type="email" value="Email:<%=j.getEmail() %> " readonly>
</div>
<div class="form-group col-md-3">
<input class="form-control form-control-sm" type="text" value="location:<%=j.getLocation() %>" readonly>
</div>

<div class="form-group col-md-3">

<input class="form-control form-control-sm"type="text" value="Category:<%=j.getCategory() %> " readonly>
</div>
</div>
<h6><b>Publish Date:<%=j.getPdate().toString() %></b></h6>
<div class="text-center">
<a href="one_view.jsp?id=<%=j.getId()%>"
class="btn btn-sm bg-success text-white">View More</a>
</div>
</div>
</div>


<%} %>


</div>
</div>
</div>

</body>
</html>