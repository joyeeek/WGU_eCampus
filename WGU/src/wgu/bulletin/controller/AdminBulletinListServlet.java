package wgu.bulletin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import wgu.bulletin.model.service.BulletinService;
import wgu.bulletin.model.vo.Bulletin;
import wgu.bulletin.model.vo.PageNum;

/**
 * Servlet implementation class AdminBulletinServlet
 */
@WebServlet("/AdminList.bu")
public class AdminBulletinListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminBulletinListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			BulletinService bService = new BulletinService();
			
			// 익명게시판
			int bListCount;
			int bCurrentPage;
			int bPageLimit;
			int boardLimit;
			int bMaxPage;
			int bStartPage;
			int bEndPage;
			
			bListCount = bService.getListCount();
			
			bCurrentPage = 1;
			if(request.getParameter("bCurrentPage") != null) {
				bCurrentPage = Integer.parseInt(request.getParameter("bCurrentPage"));
			}
			
			
			bPageLimit = 5;
			boardLimit = 5;
			
			bMaxPage = (int)Math.ceil((double)bListCount/boardLimit);
			
			bStartPage = (bCurrentPage - 1) / bPageLimit * bPageLimit + 1;
			
			bEndPage = bStartPage + bPageLimit -1;
			
			if(bMaxPage < bEndPage) {
				bEndPage = bMaxPage;
			}
			
			PageNum bp = new PageNum(bCurrentPage, bListCount, bPageLimit, boardLimit, bMaxPage, bStartPage, bEndPage);
			
			// 검색기능
			String searchtext = request.getParameter("text");
			
			
			if(searchtext == null) {
				ArrayList<Bulletin> bList = bService.selectList(bp);
				String page = null;
				if(bList != null) {
					page="WEB-INF/views/Bulletin/AdminBulletinList.jsp";
					request.setAttribute("bList", bList);
					request.setAttribute("bp", bp);
				} else {
				page="WEB-INF/views/common/error.jsp";
				request.setAttribute("msg", "게시판을 표시할 수 없습니다");
				}
				
				request.getRequestDispatcher(page).forward(request, response);
			} else {
				ArrayList<Bulletin> searchB = bService.searchList(searchtext, bp);
				
				Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
				gson.toJson(searchB, response.getWriter());	
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
