<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<!DOCTYPE html>
<html lang="en">
	<head>
			<meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
            <title>OOSE 2022 | Winter Exam</title>
            <link rel="icon" type="image/x-icon" href="Documentations/SPPU_PNG.webp">
            <link href="Rcss1.css" rel="stylesheet">
            <script>
            </script>
	</head>
<body>
	 <nav class="navbar navbar-expand-lg fixed-top navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand text-info" href="FOp.html">SPPU Q&A Repository</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav"  aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="px-2"><a href="Login.html" class="text-white fs-6 fw-light">Logout</a></li>
                        
                    </ul>
                </div>
            </div>
        </nav>
        <br><br>
        <div class="container mt-5 me-0">
            <h2 class=""> Object Oriented Software Engineering (Winter 2022)  </h2>
            <br>
            <a href="Data/OOSE_2022(winter).pdf" target="_blank">View question paper</a>
            <br>
<%			
			try{
        		Connection con=DriverManager.getConnection ("jdbc:mysql://localhost/qanda","root","");
        		Statement stmt=con.createStatement ();
%>
                <br>
                <form action="Jserver" method=post>
<%
		String Que ="select Q_Id,Question from questions where Subject='Object Oriented Software Engineering'and Year='2022'";
		ResultSet rs = stmt.executeQuery(Que);
		%>
		<label for="ques_select">Select Question Number</label>	
		<select name="que_id" class="w-50" required>
		<option value="" selected disabled hidden>Select</option>
<% 
	while(rs.next()){
%>
	<!-- Answer retrieve from database -->
	<option value="<%=rs.getString(1) %>"><%=rs.getString(2) %></option>
<%
	}
%>
</select>
			<br>
            <br>
            <textarea name="sol" title="enter ans" rows="5" cols="85" wrap="hard" required></textarea>
            <br>
            <div class="btn-group" role="group" aria-label="">
                <button type="submit" onsubmit="home.html" onclick = "window.location.href='#';" class="btn btn-info">Upload</button>
                <button type="sumbit" onsubmit="home.html" onclick = "window.location.href='#';" class="btn btn-info">Submit</button>
            </div>
            </form>
        </div>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    

<%
con.close();
} catch (Exception e) {
e.printStackTrace();
} %>
</body>
</html>