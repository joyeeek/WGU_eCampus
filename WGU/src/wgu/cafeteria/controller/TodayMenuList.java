package wgu.cafeteria.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import wgu.cafeteria.model.service.CafeteriaService;
import wgu.cafeteria.model.vo.Cafeteria;
import wgu.cafeteriamenu.todayMenu.model.service.TodayMenuService;
import wgu.cafeteriamenu.todayMenu.model.vo.TodayMenu;

/**
 * Servlet implementation class TodayMenuList
 */
@WebServlet("/list.todayMenu")
public class TodayMenuList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TodayMenuList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cafeteriaTitle = request.getParameter("listNameToday");
		String todayMenuCategory = request.getParameter("todayMenuCategory");
		
		if(todayMenuCategory.equals("1")) {
			TodayMenu tMenu = new TodayMenuService().selectTMenu(cafeteriaTitle);
		
			if(tMenu != null) {
				response.setContentType("application/json; charset=UTF-8");
			    new Gson().toJson(tMenu, response.getWriter());
			} else {
				request.setAttribute("msg", "식당조회 실패");
				request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
			}
		} else if(todayMenuCategory.equals("3")) {
			String monMenu = request.getParameter("monT");
			String tueMenu = request.getParameter("tueT");
			String wenMenu = request.getParameter("wenT");
			String thuMenu = request.getParameter("thuT");
			String friMenu = request.getParameter("friT");
			String satMenu = request.getParameter("satT");
			
			TodayMenu todayMenu = new TodayMenu(cafeteriaTitle, monMenu, tueMenu, wenMenu, thuMenu, friMenu, satMenu);
			TodayMenu tMenu = new TodayMenuService().selectTMenu(cafeteriaTitle);
			
			if(tMenu == null) { // 요일메뉴 정보가 없으면 insert
			
				int result = new TodayMenuService().insertTodayMenu(todayMenu);
			
				if(result > 0) {
					// 변경 후 식당리스트 다시 불러오기
					ArrayList<Cafeteria> cList = new CafeteriaService().selectList(); 
					request.setAttribute("cList", cList);
					request.getRequestDispatcher("WEB-INF/views/cafeteria/insertCafeteria.jsp").forward(request, response);
				} else {
					request.setAttribute("msg", "오늘의 식단 등록 실패");
					request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
				}
			} else { // 요일 메뉴 정보가 있으면 update
				int result = new TodayMenuService().updateTodayMenu(todayMenu);
				
				if(result > 0) {
					ArrayList<Cafeteria> cList = new CafeteriaService().selectList();
					request.setAttribute("cList", cList);
					request.getRequestDispatcher("WEB-INF/views/cafeteria/insertCafeteria.jsp").forward(request, response);
				} else {
					request.setAttribute("msg", "오늘의 식단 수정 실패"); 
					request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
				}
				
			}
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
