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
import com.AllShow;
import com.DBUtil;

/**
 * Servlet Filter implementation class AllNews
 */
@WebFilter(filterName = "/AllNews", urlPatterns = {"/jsp/index.jsp", "/jsp/allNew.jsp", "/admin/main.jsp"})
public class AllNews extends HttpFilter implements Filter {
       
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
     * @see HttpFilter#HttpFilter()
     */
    public AllNews() {
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
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		DBUtil db=new DBUtil();
		List<AllShow> allist = new ArrayList<AllShow>();
		db.getConn();
		
		String sql = "SELECT id, title, author, type, time FROM newsdetail";
		ResultSet rs = db.getResult(sql);
		try {
			while (rs.next()) {
				AllShow all = new AllShow();
				
				all.setId(rs.getInt("id"));
				System.out.println(rs.getInt("id"));
				
				
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
				
				String time = rs.getString("time");
				all.setTime(time.substring(0, 19));
				System.out.println(time);
				System.out.println("--------------------");
				allist.add(all);				
			}
			request.setAttribute("allist", allist);
			System.out.println("++++++++++++");
			chain.doFilter(request, response);

		} catch(SQLException e) {
			e.printStackTrace();
		}finally {
			if(db != null)
				db.release();
		}
		
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
