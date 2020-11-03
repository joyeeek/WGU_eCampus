package wgu.bulletin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import wgu.bulletin.model.vo.Attachment;
import wgu.bulletin.model.vo.Notice;

/**
 * Servlet implementation class AdminNoticeModifyServlet
 */
@WebServlet("/AdminNModify.nr")
public class AdminNoticeModifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminNoticeModifyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String nNo = request.getParameter("nNo");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		
		Notice n = new Notice(nNo, title, content);
		
		
		// file은 attachment
		String[] fileId1 = request.getParameterValues("fileId");
		String[] filePath1 = request.getParameterValues("filePath");
		String[] changeName1 = request.getParameterValues("fileCName");
		String[] originName1 = request.getParameterValues("fileOName");
		
		
		Attachment a = null;
		
		String page = null;
		
		ArrayList<Attachment> aList = new ArrayList<Attachment>();
		 
		 
		if(fileId1 != null && filePath1 != null && changeName1 != null && originName1 != null) {
			
			String fileId = "";
			String filePath = "";
			String changeName = "";
			String originName = "";
			
			
			for(int i = 0; i < fileId1.length; i++) {
			
				fileId = fileId1[i];
				filePath = filePath1[i];
				changeName = changeName1[i];
				originName = originName1[i];
				
				a = new Attachment(fileId, originName, changeName, filePath);
				
				aList.add(a);
				
			}
			
			
			
			request.setAttribute("Notice", n);
			request.setAttribute("attachment", aList);
			page = "WEB-INF/views/Notice/AdminNoticeModify.jsp";
			
		} else {
			request.setAttribute("Notice", n);
			page = "WEB-INF/views/Notice/AdminNoticeModify.jsp";
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
