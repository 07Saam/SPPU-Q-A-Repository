<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%
try {
Class.forName("com.mysql.cj.jdbc.Driver");
} 
catch (Exception e) {
	e.printStackTrace();
}

%>
<!DOCTYPE html>
<html lang="en">
 <head>
        <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
       	<link href="../Rcss1.css" rel="stylesheet">
       	<link rel="icon" type="image/x-icon" href="../Documentations/SPPU_PNG.webp">
       <title>DSA 2022 Solutions</title>
 </head>
<body>
		<nav class="navbar navbar-expand-lg fixed-top navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand text-info" href="../HView.html">SPPU Q&A Repository</a>
          		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav"    aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="px-2"><a href="../Login.html" class="text-white fs-6 fw-light">Logout</a></li>
                        
                    </ul>
                </div>
            </div>
        </nav>
        <br>
        <div class="mt-5 border border">
        <div class="row mt-5 container">
        	<div class="col-3"></div>
        	<div class="col-6 w-75 ps-0 pe-5"><p class="fw-bolder bg-dark fs-5 text-light text-center" style="">DSA 2022 (Winter) Solutions</p>
<%
try{
	
	Connection con=DriverManager.getConnection ("jdbc:mysql://localhost/qanda","root","");
	Statement stmt=con.createStatement ();;
	String Que ="select Q_Id,Question from questions where Subject='Data Structure And Algorithm'and Year='2022'";
	ResultSet rs = stmt.executeQuery(Que);
	while(rs.next()){
%>
	<!-- Questions -->
<p class="fw-bold fs-3 text-dark"><%=rs.getString(2) %></p>

<%
	String P=rs.getString(1);
	PreparedStatement ps=con.prepareStatement("select F_Id,Answer from answers where Q_Id=?");
	ps.setString(1, P);
	ResultSet A = ps.executeQuery();
	while(A.next()){ 
%>
<!-- Answers -->
	<p class="fs-4 text-dark" style="text-align:justify;"><%=A.getString(2) %></p>
<%
	PreparedStatement R=con.prepareStatement("select First_name,Last_name from faculty where F_Id=?");
	R.setString(1, A.getString(1));
	ResultSet Q = R.executeQuery();
	if(Q.next())
	{
%>
<!-- Teacher name -->
	<p><i class="fw-bold text-danger"><%=Q.getString(1) %> <%=Q.getString(2) %></i></p>
	
<%
	}	
	}
	%>
	<hr>
	<%
}

con.close();
} catch (Exception e) {
e.printStackTrace();
} %>
</div>
        	<div class="col-3"></div>
        </div>
        </div>

</body>
</html>