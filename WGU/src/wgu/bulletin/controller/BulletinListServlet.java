package wgu.bulletin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import wgu.bulletin.model.service.BulletinService;
import wgu.bulletin.model.vo.Bulletin;
import wgu.bulletin.model.vo.PageNum;

/**
 * Servlet implementation class BorderListServlet
 */
@WebServlet("/BulletinList.bu")
public class BulletinListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BulletinListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		//페이지2번 왔다갔다
		BulletinService bService = new BulletinService();
		
		
		// 페이징 처리
		
		/* 
		listCount; >> b에서 받아올 총 게시글 갯수
		currentPage; > 현재페이지번호
		pageLimit; >> 한 페이지에 표시될 페이징 갯수
		boardLimit; >> 한 페이지에 표시될 게시물 갯수
		maxPage; >> 마지막페이지
		startPage; >> 첫페이지
		endPage; >> 보여지는 페이지에서 마지막페이지 */
		
		int listCount;
		int currentPage;
		int pageLimit;
		int boardLimit;
		int maxPage;
		int startPage;
		int endPage;
		
		
		// db에서 받아올 총 게시글 갯수
		listCount = bService.getListCount();
		/* System.out.println("총게시글 : " + listCount); */
		
		/*
		 * 익명총게시물(listCount) = 100
		 * 한페이지당 공지 최대표시게시물 noticLimit = 3(고정으로 하고싶음) --> notice만들고나서 합치기
		 * 한페이지당 익명 최대표시게시물 boardLimit = 5
		 * 
		 */
		
		currentPage = 1;
		// 페이징 번호 눌렀을때 값이 null이 아니면(페이지를 눌렀다) >> URL로 보내줄것
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		// 페이징 최대 갯수 5개 표시
		pageLimit = 5;
		// 게시글 한 페이지당 개시물5개
		boardLimit = 5;
		
		// 5개까지는 같은 페이지 이지만 6개되는순간 넘어가게 하기때문에 올림해야함
		/* 
		 listCount(총게시물) => 15개 / boardLimit(한페이지당게시물) => 5개
		 6/5 -> 1.2 ->2페이지
		 7/5 -> 1.4 ->2페이지
		 9/5 -> 1.8 ->2페이지
		 10/5 -> 2.0 ->2페이지
		 11/5 -> 2.2 ->3페이지
		 15/5 -> 3.0 -> 3페이지
		*/
		maxPage = (int)Math.ceil((double)listCount/boardLimit);
		
		// 각각번호의 첫페이지 1, 6, 11, 16...... n + pageLimit (n >= 0)
		// 5일때 5면 0이나오기때문에 -1을 해줘야한다
		// >> n = (currentPage -1) / pageLimit
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		
		endPage = startPage + pageLimit - 1;
		
		// 보여지는 페이지에서 마지막페이지가 최대페이지보다 클때는 보여지는페이지에 최대페이지를 넣는다
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageNum p = new PageNum(currentPage, listCount, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		//=================================================================페이징정리
		
		ArrayList<Bulletin> list = bService.selectList(p);
		
		String page = null;
		if(list != null) {
			page = "WEB-INF/views/Bulletin/BulletinList.jsp";
			request.setAttribute("list", list);
			request.setAttribute("p", p);
		} else {
			page = "WEB-INF/views/common/error.jsp";
			request.setAttribute("msg", "게시판을 표시할 수 없습니다");
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
