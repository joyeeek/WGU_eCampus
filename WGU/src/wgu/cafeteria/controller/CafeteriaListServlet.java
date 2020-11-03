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
 * Servlet implementation class CafeteriaListServlet
 */
@WebServlet("/list.cafe")
public class CafeteriaListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CafeteriaListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Cafeteria> cList = new CafeteriaService().selectList(); // 식당 정보 가지고 오기
		String page = null;
		
		if(!cList.isEmpty()) {
			request.setAttribute("cList", cList);
			page = "WEB-INF/views/cafeteria/cafeteriaInform.jsp";
			
		} else {
			request.setAttribute("msg", "식당 조회에 실패하였습니다");
			page = "WEB-INF/views/common/errorPage.jsp";
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
