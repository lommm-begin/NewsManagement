package web.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.DBUtil;

/**
 * Servlet implementation class delNew
 */
@WebServlet(description = "/DelNew", urlPatterns = {"/DelNew"})
public class DelNew extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DelNew() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		DBUtil db=new DBUtil();
		String id = request.getParameter("id");
		String sql = "DELETE FROM newsdetail WHERE id = ?;";
		
		db.getConn();
		
		try {
			int i = db.getResultDel(sql, new String[] {id});
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
