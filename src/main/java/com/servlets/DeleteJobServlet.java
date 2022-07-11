package com.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBConnect;
import com.dao.JobDAO;
//import com.entity.Jobs;

public class DeleteJobServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	// value url ni andar pass thay chhe tethi by default get method j hoy
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			int id = Integer.parseInt(req.getParameter("id"));
			JobDAO dao = new JobDAO(DBConnect.getConn());
			boolean f = dao.deleteJobs(id);
//			Jobs j = new Jobs();
//			j.setId(id);
			
			
HttpSession session = req.getSession();
			
			
			if(f) {
				session.setAttribute("succMsg", "job delete sucessfully");
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
