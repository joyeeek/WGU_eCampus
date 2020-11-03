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

import wgu.bulletin.model.service.NoticeService;
import wgu.bulletin.model.vo.Attachment;
import wgu.bulletin.model.vo.Notice;
import wgu.common.MyFileRenamePolicy;

/**
 * Servlet implementation class AdminNoticeUpdateServlet
 */
@WebServlet("/AdminNUpdate.nr")
public class AdminNoticeUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminNoticeUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 1024 * 1024 * 10;
			
			String root = request.getSession().getServletContext().getRealPath("/");
			
			String savePath = root + "AttachedFiles/";
			
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
			
			String nNo = multiRequest.getParameter("nNo");
			String title = multiRequest.getParameter("title");
			String content = multiRequest.getParameter("content");
			
			
			ArrayList<Attachment> fileList = new ArrayList<Attachment>();
			for(int i = originFiles.size() - 1; i >= 0; i--) {
				
				Attachment at = new Attachment();
				at.setFilePath(savePath);
				at.setOriginName(originFiles.get(i));
				at.setChangeName(changeFiles.get(i));
				
				fileList.add(at);
			}
			
			NoticeService nService = new NoticeService();
			
			Notice n = new Notice(nNo, title, content);
			
			int result1 = 0;
			int result2 = 0;
			
			if(fileList.isEmpty()) {
				result1 = nService.updateNotice(n);
			} else {
				result2 = nService.updateAttachment(nNo, fileList);
				if(result2 > 0) {
					result1 = nService.updateNotice(n);
				}
			}
			
			
			
			if(result1 > 0) {
				response.sendRedirect("AdminNoticeDetail.nr?nNo=" + nNo);
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
