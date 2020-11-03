package wgu.bus.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import wgu.bus.model.service.BusService;
import wgu.bus.model.vo.Bus;

/**
 * Servlet implementation class InsertAdminBusServlet
 */
@WebServlet("/insertadminbus.wgu")
public class InsertAdminBusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertAdminBusServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int busNo = Integer.parseInt(request.getParameter("busno"));
		String busDate1 = request.getParameter("date");
		String busLine = request.getParameter("nosun");
		String busSeat = request.getParameter("choice");
		int busPrice = Integer.parseInt(request.getParameter("priceShow"));
		String busMemo = request.getParameter("memo");

		Date busDate = Date.valueOf(busDate1);
		
		Bus bus = new Bus(busNo, busDate, busLine, busSeat, busPrice, busMemo);
		System.out.println("InsertBusServlet : " + bus);
		
		ArrayList<Bus> list = new BusService().selectAllBus();
		list.add(bus);
		
		int result = new BusService().insertAdminBus(bus);
		
		String page = "";
		if(result > 0) {
			page = "WEB-INF/views/bus/busNosun1.jsp";
			request.setAttribute("list", list);
		} else {
			page = "WEB-INF/views/common/errorPage.jsp";
			request.setAttribute("msg", "버스 등록에 실패하였습니다.");
		}
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
