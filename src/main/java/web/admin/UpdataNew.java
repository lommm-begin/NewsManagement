package web.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DBUtil;

/**
 * Servlet implementation class UpdataNew
 */
@WebServlet(description = "/UpdataNew", urlPatterns = {"/UpdataNew"})
public class UpdataNew extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdataNew() {
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
		DBUtil db=new DBUtil();
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		String title = (String)request.getParameter("Title");
		String type = (String)request.getParameter("Type");
		String author = (String)request.getParameter("Author");
		String content = (String)request.getParameter("Content");
		String sql = "UPDATE newsdetail SET title = ?, author = ?, type = ?, content = ? WHERE id = ?;";
		
		db.getConn();
		
		try {
			int i = db.getResultUpdata2(sql, new String[] {title, author, type, content, id});
			response.sendRedirect(request.getContextPath() + "/admin/main.jsp");
		} finally {
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
