

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AServer
 */
@WebServlet("/AServer")
public class AServer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AServer() {
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
		
		String Question=request.getParameter("ques");
		String Subject=request.getParameter("sub");
		String Year=request.getParameter("year");
		String WS=request.getParameter("session");
		//System.out.println(Question+" "+Subject+" "+Year+" "+WS);
		
		PreparedStatement A=con.prepareStatement("insert into questions (Question,Subject,Year,WS)values(?,?,?,?)");
		A.setString(1, Question);
		A.setString(2, Subject);
		A.setString(3,Year);
		A.setString(4, WS);
		A.executeUpdate();
		pw.println("Question Uploaded");
		}
		catch(Exception E)
		{
			pw.println(E);
		}
	}

}
