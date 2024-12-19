package web.Filter;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.AllShow;
import com.DBUtil;

/**
 * Servlet Filter implementation class editNew
 */
@WebFilter(filterName = "/editNewFilter", urlPatterns = {"/admin/editNew.jsp"})
public class editNewFilter extends HttpFilter implements Filter {
       
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
     * @see HttpFilter#HttpFilter()
     */
    public editNewFilter() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		DBUtil db=new DBUtil();
		List<AllShow> allist = new ArrayList<AllShow>();
		db.getConn();
		HttpServletRequest req= (HttpServletRequest) request;
		HttpSession session=req.getSession();
		
		String id = request.getParameter("id");
		String sql = "SELECT id, title, author, type, content, time FROM newsdetail WHERE id = ?";
		ResultSet rs = db.getResult(sql, new String[]{id});
		
		try {
			if (rs.next()) {
				AllShow all = new AllShow();
				
				all.setTitle(rs.getString("title"));
				System.out.println(rs.getString("title"));
				
				all.setAuthor(rs.getString("author"));
				System.out.println(rs.getString("author"));
				
				all.setType(rs.getString("type"));
				System.out.println(rs.getString("type"));
				
				all.setContent(rs.getString("content"));
				
				all.setTime(rs.getString("time"));
				System.out.println(rs.getString("time"));
				allist.add(all);				
			}
			
			session.setAttribute("id", id);
			request.setAttribute("allist", allist);
		} catch(SQLException e) {
			e.printStackTrace();
		}finally {
			if(db != null)
				db.release();
		}
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
