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
import com.mysql.cj.Session;

/**
 * Servlet implementation class NewDetail
 */
@WebServlet(description = "/Detail", urlPatterns = {"/Detail"})
public class Detail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Detail() {
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
		List<AllShow> allist = new ArrayList<AllShow>();
		
		String id = request.getParameter("id");
		
		db.getConn();
		ResultSet rs=db.getResult("SELECT title, type, author, content, time FROM newsdetail WHERE id = ?;", new String[] {id});

		try {
			while (rs.next()) {
				AllShow all = new AllShow();
				all.setTitle(rs.getString("title"));
				System.out.println(rs.getString("title"));
				
				all.setAuthor(rs.getString("author"));
				System.out.println(rs.getString("author"));
				
				switch(rs.getString("type")) {
				case "1": all.setType("金融");break;
				case "2": all.setType("餐饮");break;
				case "3": all.setType("科技");break;
				case "4": all.setType("生活");break;
				case "5": all.setType("娱乐");break;
				case "6": all.setType("知识");break;
				default: all.setType("其他");
				}
				System.out.println(rs.getString("type"));
				
				all.setContent(rs.getString("content"));
				
				String time = rs.getString("time");
				all.setTime(time.substring(0, 19));
				System.out.println(rs.getString("time"));
				allist.add(all);				
			}
			request.setAttribute("allist", allist);
			request.setAttribute("id", String.valueOf(id));
			request.getRequestDispatcher("/jsp/detail.jsp").forward(request, response);

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
