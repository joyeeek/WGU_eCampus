package wgu.bulletin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import wgu.bulletin.model.service.BulletinService;
import wgu.bulletin.model.vo.Attachment;
import wgu.bulletin.model.vo.Bulletin;
import wgu.bulletin.model.vo.Comments;

/**
 * Servlet implementation class BulletinDetailServlet
 */
@WebServlet("/BulletinDetail.bu")
public class BulletinDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BulletinDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String bNo = request.getParameter("bNo");
		
		BulletinService bService = new BulletinService();
		
		// 게시글 디테일(가져오기)
		Bulletin b = bService.selectBulletin(bNo);
		
		
		// 이전페이지 
		ArrayList<Bulletin> beforepage = bService.beforeList(bNo);
		// 다음페이지
		ArrayList<Bulletin> afterpage = bService.afterList(bNo);
		
		// 첨부파일 이름가져오기
		ArrayList<Attachment> a = bService.selectAttachment(bNo);
		
		
		
		// 댓글가져오기
		ArrayList<Comments> comm = bService.selectCommentList(bNo);
		
		
		String page = null;
		if(b != null) {
			page = "WEB-INF/views/Bulletin/BulletinDetail.jsp";
			request.setAttribute("bulletin", b);
			request.setAttribute("comm", comm);
			request.setAttribute("Attach", a);
			request.setAttribute("beforepage", beforepage);
			request.setAttribute("afterpage", afterpage);
		} else {
			request.setAttribute("msg", "게시물을 볼 수 없습니다");
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
