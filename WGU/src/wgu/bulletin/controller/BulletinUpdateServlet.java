package wgu.bulletin.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import wgu.bulletin.model.service.BulletinService;
import wgu.bulletin.model.vo.Attachment;
import wgu.bulletin.model.vo.Bulletin;
import wgu.common.MyFileRenamePolicy;

/**
 * Servlet implementation class BulletinUpdateServlet
 */
@WebServlet("/B_Update.bu")
public class BulletinUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BulletinUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 1024 * 1024 * 10;
			
			// 웹서버 Context경로
			String root = request.getSession().getServletContext().getRealPath("/");
			// root >> D:\Project\WGU\WebContent\
			// 첨부파일 저장경로
			String savePath = root + "AttachedFiles/";
			
			// 폴더가 없으면 만들어주게 한다
			File f = new File(savePath);
			if(!f.exists()) {
				f.mkdirs();
			}
			
			// 파일이름 바꿔주기
			MultipartRequest multiRequest =
					new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
		
			
			ArrayList<String> changeFiles = new ArrayList<String>(); // 바뀐 파일의 이름을 저장할 ArrayList
			ArrayList<String> originFiles = new ArrayList<String>(); // 원본 파일의 이름을 저장할 ArrayList
			
			Enumeration<String> files = multiRequest.getFileNames(); // getFileNames : form에서 전송된 파일list들의 이름을 나열
			
			
			while(files.hasMoreElements()) {
				String name = files.nextElement();
				
				if(multiRequest.getFilesystemName(name) != null	) {
					
					// 바뀐이름을 넣는다
					changeFiles.add(multiRequest.getFilesystemName(name));
					// 원래넣을때의 이름을 넣는다
					originFiles.add(multiRequest.getOriginalFileName(name));
					//=============================================================여기까지 파일을 가져온것
				}
			}
			
			// 익명게시판 No, title, content가져오기
			// 파일첨부 완료되면 파일첨부도 같이 가져오기
			String bNo = multiRequest.getParameter("bNo");
			String title = multiRequest.getParameter("b_title");
			String content = multiRequest.getParameter("b_content");
			
			
			
			ArrayList<Attachment> fileList = new ArrayList<Attachment>();
			for(int i = originFiles.size() - 1; i >= 0; i--) {
				Attachment at = new Attachment();
				at.setFilePath(savePath);
				at.setOriginName(originFiles.get(i));
				at.setChangeName(changeFiles.get(i));
				
				fileList.add(at);
			}
			
			BulletinService bService = new BulletinService();
			
			Bulletin b = new Bulletin(bNo, title, content);
			
			int result1 = 0;
			int result2 = 0;
			
			if(fileList.isEmpty()) {
				result1 = bService.updateBulletin(b);
			} else {
				result2 = bService.updateAttachment(bNo, fileList);
				if(result2 > 0) {
					result1 = bService.updateBulletin(b);
				}
			}
			
			
			if(result1 > 0)	{
				response.sendRedirect("BulletinDetail.bu?bNo=" + bNo);
			} else {
				request.setAttribute("msg", "게시물 수정에 실패하셨습니다.");
				request.getRequestDispatcher("WEB-INF/views/common/error.jsp");
			}
			
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
