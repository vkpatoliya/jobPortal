package com.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBConnect;
import com.dao.UserDAO;
import com.entity.User;

public class RegisterServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		

		try {
			
			String name = req.getParameter("name");
			
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			String qualification = req.getParameter("qualification");
			
			
			UserDAO dao = new UserDAO(DBConnect.getConn());
			User u = new User(name,email,password,qualification,"user");
			boolean f = dao.addUser(u);

			
			
HttpSession session = req.getSession();
			
			
			if(f) {
				session.setAttribute("succMsg", "Registrartion Sucessfully");
				resp.sendRedirect("signup.jsp");
				
			}else {
				session.setAttribute("succMsg", "something wrong on servlet");
				resp.sendRedirect("signup.jsp");
				
			}
	}catch(Exception e) {
		
		e.printStackTrace();
	}
	
	

}
}
