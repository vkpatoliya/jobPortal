package com.servlets;
import com.entity.*;
import java.io.IOException;

import javax.servlet.*;
import javax.servlet.http.*;

//@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String em = req.getParameter("email");
			String ps = req.getParameter("password");
			User u = new User();
			HttpSession session= req.getSession();
			
			if("admin@gmail.com".equals(em) && "admin@123".equals(ps)) {
				session.setAttribute("userobj",u);
				u.setRole("admin");
				resp.sendRedirect("admin.jsp");
			}else {
				
			}
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

}
