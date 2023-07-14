

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class Jserver
 */
@WebServlet("/Jserver")
public class Jserver extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Jserver() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter pw=response.getWriter();
		String F = null;
		Cookie cookies[]=request.getCookies();
		for(Cookie c: cookies)
		{
			if(c.getName().equals("ID"))
			{
				F=c.getValue();
				//System.out.println(F);
			}
		}
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con=DriverManager.getConnection ("jdbc:mysql://localhost/qanda","root","");
	
		String Q =request.getParameter("que_id");
		String S =request.getParameter("sol");
		PreparedStatement ps=con.prepareStatement("insert into answers values(?,?,?);");
		ps.setString(1, Q);
		ps.setString(2, F);
		ps.setString(3, S);
		ps.executeUpdate();
		pw.println("Answer Uploaded SuccsessFully ...");
		//Thread.sleep(null);
		//String A="Home.html";
		//response.sendRedirect(A);
		}
		catch(Exception e)
		{
			pw.print(e);
		//	System.out.println(e);
		}
	}

}
