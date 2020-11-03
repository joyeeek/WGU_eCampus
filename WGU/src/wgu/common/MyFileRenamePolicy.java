package wgu.common;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class MyFileRenamePolicy implements FileRenamePolicy {

	@Override
	public File rename(File originName) {
		
		// 오늘날짜 + 랜덤숫자
		
		// 현재날짜+시간
		long currentTime = System.currentTimeMillis();
		
		// 원하는 시간format으로 출력
		SimpleDateFormat date = new SimpleDateFormat("yyyyMMddHHmmss");
		// 랜덤 숫자
		int random = (int)(Math.random()*1000);
		
		// 확장자명 가져오기
		String name = originName.getName(); // 파일이름
		String exe = null; // 확장자명 넣을 변수
		int dot = name.lastIndexOf(".");
		if(dot != -1){ //lastIndexOf는 마지막 문자열의 index를 반환한다. >> .을기준으로 index반환
			exe = name.substring(dot);
		} else {
			exe = "";
		}
		
		// 새로운 파일명만들기(위에꺼 합치기)
		String nFileName = date.format(new Date(currentTime)) + random + exe;
		
		// file저장
		File newFile = new File(originName.getParent(), nFileName);
		
		return newFile;
	}

}
