package wgu.bus.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import wgu.bus.model.service.BusService;

/**
 * Servlet implementation class ModifyAdminBusServlet
 */
@WebServlet("/modifyadminbus.wgu")
public class ModifyAdminBusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifyAdminBusServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int result = new BusService().deleteAdminBus(Integer.parseInt(request.getParameter("busno")));
		
		String page = null;
		
		if(result > 0) {
			page = "WEB-INF/views/common/errorPage.jsp";
			request.setAttribute("msg", "버스 삭제에 성공하였습니다.");
		} else {
			page = "WEB-INF/views/common/errorPage.jsp";
			request.setAttribute("msg", "버스 삭제에 실패하였습니다.");
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
