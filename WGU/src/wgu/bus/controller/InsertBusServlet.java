package wgu.bus.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import wgu.bus.model.service.BusService;
import wgu.bus.model.vo.Bus;
import wgu.bus.model.vo.BusTicket;

/**
 * Servlet implementation class InsertBusServlet
 */
@WebServlet("/insert.wgu")
public class InsertBusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertBusServlet() {
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
		
		String memberNo = request.getParameter("memberNo");

		int ticketNo = (int)(Math.random()*100000 + 1);
		Date busDate = Date.valueOf(busDate1);
		
		Bus bus = new Bus(busNo, busDate, busLine, busSeat, busPrice);
		BusTicket busTicket = new BusTicket(ticketNo, memberNo, busNo);
		
		System.out.println("InsertMemberServlet : " + bus);
		System.out.println("InsertBusTicketServlet : " + busTicket);
		
		int result = new BusService().insertBus(bus);
		int result2 = new BusService().insertBusTicket(busTicket);
		
		String page = "";
		if(result > 0 && result2 > 0) {
			page = "WEB-INF/views/bus/ticket.jsp";
			request.setAttribute("bus", bus);
		} else {
			page = "WEB-INF/views/common/errorPage.jsp";
			request.setAttribute("msg", "버스 예약에 실패하였습니다.");
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
