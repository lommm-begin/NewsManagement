package web.admin;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.DBUtil;

/**
 * Servlet implementation class AddNEw
 */
@WebServlet(description = "/AddNew", urlPatterns = {"/AddNew"})
public class AddNew extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddNew() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		HttpSession session = request.getSession();
		DBUtil db=new DBUtil();
		db.getConn();
		
		String id = (String)session.getAttribute("id-new");
		String title = (String)request.getParameter("Title");
		String type = (String)request.getParameter("Type");
		String author = (String)request.getParameter("Author");
		String content = (String)request.getParameter("Content");
		String time = (String)session.getAttribute("time");
		
		String sql = "INSERT INTO newsdetail (id, title, author, type, content, time) VALUES (?, ?, ?, ?, ?, ?);";
		db.getResultUpdata(sql, new String[] {id, title, author, type, content, time});
		
		try {
			session.setAttribute("id-new", null);
			response.sendRedirect(request.getContextPath() + "/admin/main.jsp");
		} catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(db != null)
				db.release();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
