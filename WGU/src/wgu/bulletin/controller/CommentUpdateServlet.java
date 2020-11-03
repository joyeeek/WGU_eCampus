package wgu.bulletin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import wgu.bulletin.model.service.BulletinService;
import wgu.bulletin.model.vo.Comments;

/**
 * Servlet implementation class CommentUpdateServlet
 */
@WebServlet("/CommentUpdate.bu")
public class CommentUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String bNo = request.getParameter("bNo");
		String cNo = request.getParameter("cNo");
		String content = request.getParameter("content");
		
		Comments c = new Comments();
		c.setBulletinNo(bNo);
		c.setCommentsNo(cNo);
		c.setComments(content);
		
		

		new BulletinService().updateComment(c);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
