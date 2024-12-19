package web.Filter;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.AllShow;
import com.DBUtil;

/**
 * Servlet Filter implementation class AdminSearchNew
 */
@WebFilter(filterName = "/AdminSearchNew", urlPatterns = {"/admin/adminSearch.jsp"})
public class AdminSearchNew extends HttpFilter implements Filter {
       
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
     * @see HttpFilter#HttpFilter()
     */
    public AdminSearchNew() {
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
		// TODO Auto-generated method stub
		HttpServletRequest req= (HttpServletRequest) request;
		HttpSession session = req.getSession();
		String adminname = null;
		Cookie a[] = req.getCookies();
		
		if (a != null) {
            for (Cookie cookie : a) {
                if ((cookie.getName()).equals("adminname")) {
                    adminname = cookie.getValue();
                    break;
                }
            }
        }

		if (adminname == null || adminname.isEmpty()) {
	        req.getRequestDispatcher("/jsp/search.jsp").forward(request, response);
            return;
        }
		
		DBUtil db=new DBUtil();
		
		db.getConn();
		ResultSet rs=db.getResult("select * from admin where adminname=?", new String[] {adminname});
		try {
			if(rs.next()) {
				session.setAttribute("adminname", adminname);
				chain.doFilter(request, response);
			}else {
				req.getRequestDispatcher("/jsp/search.jsp").forward(request, response);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}finally {
			if(db !=null)
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
