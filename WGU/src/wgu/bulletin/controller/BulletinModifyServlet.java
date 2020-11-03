package wgu.bulletin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import wgu.bulletin.model.vo.Attachment;
import wgu.bulletin.model.vo.Bulletin;

/**
 * Servlet implementation class BModifyServlet
 */
@WebServlet("/BModify.bu")
public class BulletinModifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BulletinModifyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String bNo = request.getParameter("bId");
		String title = request.getParameter("b_title");
		String content = request.getParameter("b_content");
		
		Bulletin b = new Bulletin(bNo, title, content);
		
		String[] fileId1 = request.getParameterValues("b_fileId");
		String[] filePath1 = request.getParameterValues("b_filePath");
		String[] changeName1 = request.getParameterValues("b_fileCName");
		String[] originName1 = request.getParameterValues("b_fileOName");
		
		
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
		
			request.setAttribute("b", b);
			request.setAttribute("aList", aList);
			page = "WEB-INF/views/Bulletin/BulletinUpdate.jsp";
			
			
		} else {
			request.setAttribute("b", b);
			page = "WEB-INF/views/Bulletin/BulletinUpdate.jsp"; 
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
