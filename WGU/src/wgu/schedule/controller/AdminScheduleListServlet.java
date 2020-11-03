package wgu.schedule.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import wgu.schedule.model.service.ScheduleService;
import wgu.schedule.model.vo.Schedule;

/**
 * Servlet implementation class AdminScheduleListServlet
 */
@WebServlet("/adminSList.sc")
public class AdminScheduleListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminScheduleListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("UTF-8");
				
			ArrayList<Schedule> list = new ScheduleService().selectList();
			
			String page = null;
			if(list != null) {
				request.setAttribute("list", list);
				page = "WEB-INF/views/Schedule/AdminScheduleList.jsp";
			} else {
				page = "WEB-INF/views/common/error.jsp";
				request.setAttribute("msg", "관리페이지를 불러올 수 없습니다.");
			}
			
			request.getRequestDispatcher(page).forward(request, response);
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
