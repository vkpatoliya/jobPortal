<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.DB.DBConnect" %>
<%@page import="java.sql.Connection" %>
  <%@page import="com.dao.JobDAO" %>
    <%@page import="com.entity.Jobs" %>
     <%@page import="java.util.List" %>
          <%@page import="java.util.ArrayList" %>
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
<div class="container" >
<div class="row">
<div class="col-md-12">


<h5 class="text-center text-primary">ALL Jobs</h5>

<%
String location = request.getParameter("location");
String category = request.getParameter("category");
String message = "";

JobDAO dao = new JobDAO(DBConnect.getConn());
List<Jobs> list = null;
if("lo".equals(location) && "ca".equals(category)){
	list = new ArrayList<Jobs>();
	message = "Job Not Available";
} else if("lo".equals(location) || "ca".equals(category)){
	list = dao.getJobsORLocationAndCate(category,location);
} else {
	list = dao.getJobsAndLocationAndCate(category,location);
}
if(list.isEmpty()){
	

%><h4 class="text-center text-danger">Job Not Available</h4>

<%
}
if(list !=null){
	for(Jobs j :list){
	

%>

<div class="card-mt-2" >
<div class="card-body">

<div class="text-center text-primary">
<i class="far fa-clipboard fa-2x"></i>
</div>

<h6><b><%=j.getTitle() %></b></h6>
<p><%=j.getDescription() %></p>
<br>


<div class="form-row">
<div class="form-group col-md-3">
<input class="form-control form-control-sm" type="text" value="Email:<%=j.getEmail() %>" readonly>
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
<%
}
}
else{
%>
<h4 class="text-center text-danger"><%=message%></h4>

<%} %>


</div>
</div>

</div>



</body>
</html>