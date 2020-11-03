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

import wgu.bulletin.model.service.NoticeService;
import wgu.bulletin.model.vo.Notice;
import wgu.bulletin.model.vo.PageNum;

/**
 * Servlet implementation class 임시admin공지servlet
 */
@WebServlet("/AdminNoticeList.nr")
public class AdminNoticeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminNoticeListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 공지사항
		
		int nListCount;
		int nCurrentPage;
		int nPageLimit;
		int noticeLimit;
		int nMaxPage;
		int nStartPage;
		int nEndPage;
		
		NoticeService nService = new NoticeService();
		
		nListCount = nService.getListCount();
		
		nCurrentPage = 1;
		if(request.getParameter("nCurrentPage") != null) {
			nCurrentPage = Integer.parseInt(request.getParameter("nCurrentPage"));
		}
		
		nPageLimit = 5;
		noticeLimit = 10;
		
		nMaxPage = (int)Math.ceil((double)nListCount/noticeLimit);
		nStartPage = (nCurrentPage - 1) / nPageLimit * nPageLimit + 1;
		nEndPage = nStartPage + nPageLimit - 1;
		if(nMaxPage < nEndPage) {
			nEndPage = nMaxPage;
		}
		
		PageNum np = new PageNum(nCurrentPage, nListCount, nPageLimit, noticeLimit, nMaxPage, nStartPage, nEndPage);
		
		
		
		// 검색기능
		String searchtext = request.getParameter("text");
		
		if(searchtext == null) {
			ArrayList<Notice> nList = nService.selectList(np);
			String page = null;
			if(nList != null) {
				page="WEB-INF/views/Bulletin/AdminNoticeList.jsp";
				request.setAttribute("nList", nList);;
				request.setAttribute("np", np);
			} else {
				page="WEB-INF/views/common/error.jsp";
				request.setAttribute("msg", "게시판을 표시할 수 없습니다");
			}
		
			request.getRequestDispatcher(page).forward(request, response);
		} else {
			ArrayList<Notice> searchN = nService.searchList(searchtext, np);
			
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			gson.toJson(searchN, response.getWriter());	
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
