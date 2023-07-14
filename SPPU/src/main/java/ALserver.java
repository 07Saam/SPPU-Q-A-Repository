

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ALserver
 */
@WebServlet("/ALserver")
public class ALserver extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ALserver() {
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
			PreparedStatement ps=con.prepareStatement("Select mobile from admin where mobile=? and Password=?;");
			ps.setString(1, N);
			ps.setString(2, P);
			ResultSet rs =ps.executeQuery();	
			//System.out.println(rs.next());
			if(rs.next()==false)
			{
				pw.println("Sorry ! You Entered Wrong Mobile number Or Password.Please Try Again!! ");
				//System.out.println("FALSE ..");
				System.out.println(N+" "+P);
			}
			else
			{
				response.sendRedirect("APage.html");
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
