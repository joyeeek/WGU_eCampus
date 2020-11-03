package wgu.cafeteria.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import wgu.cafeteria.model.service.CafeteriaService;
import wgu.cafeteria.model.vo.Cafeteria;

/**
 * Servlet implementation class InsertCafeteria
 */
@WebServlet("/insert.cafe")
public class InsertCafeteria extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertCafeteria() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Cafeteria> cList = new CafeteriaService().selectList(); // 식당정보 가지고 오기
		request.setAttribute("cList", cList);
		request.getRequestDispatcher("WEB-INF/views/cafeteria/insertCafeteria.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
