package wgu.schedule.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import wgu.schedule.model.service.ScheduleService;
import wgu.schedule.model.vo.Schedule;

/**
 * Servlet implementation class AdminScheduleUpdateServlet
 */
@WebServlet("/AdminSUpdate.sc")
public class AdminScheduleUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminScheduleUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String sNo = request.getParameter("sNo");
		String title = request.getParameter("modifyT");
		String content = request.getParameter("modifyC");
		String dateS = request.getParameter("modifyD");
		
		Date date = null;
		if(dateS != null) {
			String[] dArr = dateS.split("-");
			
			int year = Integer.parseInt(dArr[0]);
			int month = Integer.parseInt(dArr[1])-1;
			int day = Integer.parseInt(dArr[2]);
			
			date = new Date(new GregorianCalendar(year, month, day).getTimeInMillis());
		} else {
			date = new Date(new GregorianCalendar().getTimeInMillis());
		}
		
		Schedule s = new Schedule(sNo, date, content, title);
		
		new ScheduleService().updateSchedule(s);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
