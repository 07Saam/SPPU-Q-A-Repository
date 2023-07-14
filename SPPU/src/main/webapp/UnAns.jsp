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
	<body>
	<meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
            <title>NT 2022 | Winter Exam</title>
            
            <link href="Rcss1.css" rel="stylesheet">
            <script>
            </script>
            <style>
            	body{
            		background-image: linear-gradient(to right, #c0d1c2, #c0d1c2);
            	}
            	h2, th, td{
            		text-align: center;
            	}
            </style>
	</head>
	<nav class="navbar navbar-expand-lg fixed-top navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand text-info" href="home.html">SPPU Q&A Repository</a>
            </div>
        </nav>
        <br>
        <section>
         
         <div class="container mt-5">
         <table class="border border-light">
         <tr class="border border-light">
            <h2> Unanswered Questions  </h2>
          </tr>
            
            <tr class="border border-light">
            <th class="px-2 border-end">Q_Id</th>
            <th class="px-2 border-end">Question</th>
            <th class="px-2 border-end">Subject</th>
            <th class="px-2 border-end">Year</th>
            <th class="px-2 border-end">W/S</th>
            </tr>
<%			
			try{
        		Connection con=DriverManager.getConnection ("jdbc:mysql://localhost/qanda","root","");
        		Statement stmt=con.createStatement (); 
        		String U="Select * from Questions where Q_Id NOT IN (Select Q_Id From Answers)";
        		String A="1";
        		ResultSet R=stmt.executeQuery(U);
        		while(R.next()){
%>
				<tr class="border border-light"X>
				<td class="px-2 border-end"><%=R.getString(1)%></td>
				<td class="px-2 border-end" style="text-align:justify;"><%=R.getString(2)%></td>
				<td class="px-2 border-end"><%=R.getString(3)%></td>
				<td class="px-2 border-end"><%=R.getString(4)%></td>
				<%if(R.getString(5)==A)
				{%>
					<td class="px-2 border-end">W</td>
				<%
				}
				else{
				%>
					<td class="px-2 border-end">S</td>
				<%	
				} 
			%>
				</tr>
<%	
	}
%>
   			       	
</table>
<%        		
con.close();
} catch (Exception e) {
e.printStackTrace();
} %>
</section>
</body>
</html>