package wgu.schedule.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import wgu.schedule.model.service.ScheduleService;
import wgu.schedule.model.vo.Schedule;

/**
 * Servlet implementation class calendarServlet
 */
@WebServlet("/AdminSInsert.sc")
public class AdminScheduleInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminScheduleInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String dateS = request.getParameter("date");
		
		Date date = null;
		if(dateS != "") {
			String[] dArr = dateS.split("-");
			
			int year = Integer.parseInt(dArr[0]);
			int month = Integer.parseInt(dArr[1]) - 1;
			int day = Integer.parseInt(dArr[2]);
			
			date = new Date(new GregorianCalendar(year, month, day).getTimeInMillis());
		} else {
			date = new Date(new GregorianCalendar().getTimeInMillis());
		}
		
		Schedule s = new Schedule(date, content, title);
		
		ArrayList<Schedule> list = new ScheduleService().insertSchedule(s);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(list, response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
