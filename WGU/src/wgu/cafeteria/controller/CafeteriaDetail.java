package wgu.cafeteria.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import wgu.cafeteria.model.service.CafeteriaService;
import wgu.cafeteria.model.vo.Cafeteria;

/**
 * Servlet implementation class CafeteriaDetail
 */
@WebServlet("/detail.cafe")
public class CafeteriaDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CafeteriaDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cafeteriaTitle = request.getParameter("listName");
		
		Cafeteria cafeteria = new CafeteriaService().selectCafeList(cafeteriaTitle);
		
		if(cafeteria != null) {
			response.setContentType("application/json; charset=UTF-8");
		    new Gson().toJson(cafeteria, response.getWriter());
		} else {
			request.setAttribute("msg", "식당조회 실패"); 
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
