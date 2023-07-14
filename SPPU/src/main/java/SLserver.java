import java.sql.*;
import java.io.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SLserver
 */
@WebServlet("/SLserver")
public class SLserver extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SLserver() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter pw=response.getWriter();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection ("jdbc:mysql://localhost/qanda","root","");
			String N =request.getParameter("mobile");
			String P =request.getParameter("pass");
			PreparedStatement ps=con.prepareStatement("Select mobile from student where mobile=? and password=?;");
			ps.setString(1, N);
			ps.setString(2, P);
			ResultSet rs =ps.executeQuery();	
			//System.out.println(rs.next());
			if(rs.next()==false)
			{
				pw.println("Sorry ! You Entered Wrong Mobile number Or Password.Please Try Again!! ");
				//System.out.println("FALSE ..");
				//System.out.println(N+" "+P);
			}
			else
			{
				response.sendRedirect("HView.html");
				//System.out.println("True ..");
				//System.out.println(N+" "+P);
			}
			con.close();
		}
		catch (Exception e)
		{
			pw.print(e);
		//System.out.println(e);
		}
	}
}
