package web.user;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.AllShow;
import com.DBUtil;

/**
 * Servlet implementation class ShowNew
 */
@WebServlet(description = "/ShowNew", urlPatterns = {"/ShowNew"})
public class ShowNew extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowNew() {
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
		String id = request.getParameter("id");
		
		List<AllShow> allist = new ArrayList<AllShow>();
		
		db.getConn();
		ResultSet rs=db.getResult("SELECT id, title, author, type, time FROM newsdetail WHERE id = ?;", new String[] {id});
		try {
			if (rs.next() && id != null) {
				AllShow all = new AllShow();
				
				all.setId(rs.getInt("id"));
				System.out.println(rs.getInt("id"));
				
				all.setTitle(rs.getString("title"));
				System.out.println(rs.getString("title"));
				
				all.setAuthor(rs.getString("author"));
				System.out.println(rs.getString("author"));
				
				all.setTime(rs.getString("time"));
				System.out.println(rs.getString("time"));
				allist.add(all);				
			}
			session.setAttribute("allist", allist);
			response.sendRedirect(request.getContextPath() + "/admin/adminSearch.jsp");

		} catch(SQLException e) {
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
