
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;


public class LoginFilter implements Filter {
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("登陆过滤器开启");
    }

    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest)servletRequest;
        Object user = request.getSession().getAttribute("user");
        String ff = request.getContextPath()+":"+request.getServerPort()+""+request.getRequestURI();
        String loginPath = request.getServletPath();
        //用户已登录 或者 直接去登陆页面的  直接允许访问
        if((user != null && !"null".equals(user)) || "/user/user/login".equals(loginPath)){
            filterChain.doFilter(servletRequest,servletResponse);
        }else{
            request.getRequestDispatcher("/login.jsp").forward(servletRequest, servletResponse);
        }
    }

    public void destroy() {
        System.out.println("登陆过滤器销毁");
    }
}
