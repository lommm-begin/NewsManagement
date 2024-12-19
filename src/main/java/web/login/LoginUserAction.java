package web.login;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DBUtil;
@WebServlet(description = "/LoginUserAction", urlPatterns = { "/LoginUserAction"})
public class LoginUserAction extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	public void doGet(HttpServletRequest request,HttpServletResponse response)
	throws ServletException,IOException {
		doPost(request,response);
   }
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException,IOException {
		
		String adminname = request.getParameter("adminname");
		String adminpass = request.getParameter("adminpass");
		
		DBUtil db=new DBUtil();
		db.getConn();
		
		ResultSet rs=db.getResult("select * from admin where adminname=? and adminpass=?", new String[] {adminname,adminpass});

		try {
			if(rs !=null && rs.next()) {
				HttpSession session=request.getSession();
				session.setAttribute("adminname", adminname);
				Cookie c = new Cookie("adminname", adminname);
				c.setHttpOnly(true);
				c.setSecure(true);
				c.setMaxAge(60 * 60 * 24);
				response.addCookie(c);
				
				response.sendRedirect(request.getContextPath() + "/admin/main.jsp");
			}else {
				request.getRequestDispatcher("/jsp/login.jsp").forward(request, response);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}finally {
			if(db !=null)
				db.release();
		}
   }
}