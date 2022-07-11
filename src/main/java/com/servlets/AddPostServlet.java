package com.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBConnect;
import com.dao.JobDAO;
import com.entity.Jobs;

public class AddPostServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
		
			String title = req.getParameter("title");
			String desc = req.getParameter("desc");
			String category = req.getParameter("category");

			String status = req.getParameter("status");
			String location = req.getParameter("location");
			String email = req.getParameter("email");
			
		
			
			Jobs j = new Jobs();
			j.setTitle(title);
			j.setDescription(desc);
			j.setCategory(category);
			j.setStatus(status);
			j.setLocation(location);
			j.setEmail(email);
	
			
			HttpSession session = req.getSession();
			
			JobDAO dao = new JobDAO(DBConnect.getConn());
			boolean f = dao.addJobs(j);
			if(f) {
				session.setAttribute("succMsg", "job post sucessfully");
				resp.sendRedirect("add_job.jsp");
				
			}else {
				session.setAttribute("succMsg", "something wrong on servlet");
				resp.sendRedirect("add_job.jsp");
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}
	

}
}
