package com.servlets;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

import com.entity.Jobs;
import com.DB.DBConnect;
import com.dao.JobDAO;
public class UpdateJobServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
		    int id=Integer.parseInt(req.getParameter("id"));
			String title = req.getParameter("title");
			String desc = req.getParameter("desc");
			String category = req.getParameter("category");

			String status = req.getParameter("status");
			String location = req.getParameter("location");
			String email = req.getParameter("email");
			
			Jobs j = new Jobs();
			j.setId(id);
			j.setTitle(title);
			j.setDescription(desc);
			j.setCategory(category);
			j.setStatus(status);
			j.setLocation(location);
			j.setEmail(email);
			
HttpSession session = req.getSession();
			
			JobDAO dao = new JobDAO(DBConnect.getConn());
			boolean f = dao.updateJob(j);
			if(f) {
				session.setAttribute("succMsg", "job update sucessfully");
				resp.sendRedirect("view_jobs.jsp");
				
			}else {
				session.setAttribute("succMsg", "something wrong on servlet");
				resp.sendRedirect("view_jobs.jsp");
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}
	
	
			
		
		
	}
	
	

}
