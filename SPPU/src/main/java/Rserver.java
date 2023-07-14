import java.sql.*;
import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Rserver
 */
@WebServlet("/Rserver")
public class Rserver extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Rserver() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter pw=response.getWriter();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con=DriverManager.getConnection ("jdbc:mysql://localhost/qanda","root","");
		Statement stmt=con.createStatement ();
		String Fname=request.getParameter("fname");
		String Lname=request.getParameter("lname");
		String Mobile=request.getParameter("mobile");
		String Email=request.getParameter("email");
		String pass=request.getParameter("password");
		String Check=request.getParameter("utype");
		
		String s;
		if(Check.equals("Faculty")) {
			s="insert into faculty (First_name,Last_name,mobile,email,password) values('"+Fname+"','"+Lname+"','"+Mobile+"','"+Email+"','"+pass+"')";
			pw.println("Faculty Registered Successfully !!");			
		}else
		{
			s="insert into student (First_name,Last_name,mobile,email,password) values('"+Fname+"','"+Lname+"','"+Mobile+"','"+Email+"','"+pass+"')";
			pw.println("Student Registered Successfully !!");
		}
		int i=stmt.executeUpdate(s);
		//System.out.println(i+" Record Added");
		RequestDispatcher rd =request.getRequestDispatcher("Login.html");
		rd.forward(request,response);
		con.close();
		}
		catch (Exception e)
		{
			pw.println(e);
		}
	}

}
