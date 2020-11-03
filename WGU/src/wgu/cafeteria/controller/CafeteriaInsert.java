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

/**
 * Servlet implementation class CafeteriaInsert
 */
@WebServlet("/insertList.cafe")
public class CafeteriaInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CafeteriaInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String insertCafeteria = request.getParameter("insertCafeteria");
		
		if(insertCafeteria.equals("5")) { // 5가 들어오면 새로운 식당리스트 생성
			String cafeteriaTitle = request.getParameter("ca");
			String cafeteriaTime = request.getParameter("cafeTime");
			String cafeteriaLocation = request.getParameter("cafePlace");			
			int cafeteriaPrice = Integer.parseInt(request.getParameter("cafePrice"));
	
			Cafeteria cafeteria = new Cafeteria(cafeteriaTitle, cafeteriaTime, cafeteriaLocation, cafeteriaPrice);
			int result = new CafeteriaService().insertCafeteria(cafeteria);
		
			if(result > 0) {
				// result 추가 후 새로운 식당 리스트 받아오는 작업
				ArrayList<Cafeteria> cList = new CafeteriaService().selectList();
				request.setAttribute("cList", cList);
				request.getRequestDispatcher("WEB-INF/views/cafeteria/insertCafeteria.jsp").forward(request, response);
			} else {
				request.setAttribute("msg", "식당등록 실패");
				request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
			}
		} else if(insertCafeteria.equals("3")) { // 3이 들어오면 식당정보 해당 내용으로 수정
			String cafeteriaTitle = request.getParameter("listName");
			String cafeteriaTime = request.getParameter("cafeTime");
			String cafeteriaLocation = request.getParameter("cafePlace");			
			int cafeteriaPrice = Integer.parseInt(request.getParameter("cafePrice"));
		
			Cafeteria cafeteria = new Cafeteria(cafeteriaTitle, cafeteriaTime, cafeteriaLocation, cafeteriaPrice);
			int result = new CafeteriaService().updateCafeteria(cafeteria);
			
			if(result > 0) {
				ArrayList<Cafeteria> cList = new CafeteriaService().selectList();
				request.setAttribute("cList", cList);
				request.getRequestDispatcher("WEB-INF/views/cafeteria/insertCafeteria.jsp").forward(request, response);
			} else {
				request.setAttribute("msg", "식당수정 실패");
				request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
			}
		} else if(insertCafeteria.equals("1")) { // 1이 들어오면 식당 정보 상세 조회
			String cafeteriaTitle = request.getParameter("listName");
			
			Cafeteria cafeteria = new CafeteriaService().selectCafeList(cafeteriaTitle);
			
			if(cafeteria != null) {
				response.setContentType("application/json; charset=UTF-8");
			    new Gson().toJson(cafeteria, response.getWriter());
			} else {
				request.setAttribute("msg", "식당조회 실패"); 
				request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
			}
		} else if(insertCafeteria.equals("7")) { // 7이 들어오면 식당 삭제 + 오늘의 식단까지 한번에 삭제
			String cafeteriaTitle = request.getParameter("listName");
			
			int result = new CafeteriaService().deleteCafeList(cafeteriaTitle);
			
			if(result > 0) {
				ArrayList<Cafeteria> cList = new CafeteriaService().selectList();
				request.setAttribute("cList", cList);
				request.getRequestDispatcher("WEB-INF/views/cafeteria/insertCafeteria.jsp").forward(request, response);
			} else {
				request.setAttribute("msg", "식당수정 실패");
				request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
			}
			
		} else {
			request.setAttribute("msg", "상세조회 실패중"); 
			request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
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
