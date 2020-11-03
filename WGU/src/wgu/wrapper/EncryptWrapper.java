package wgu.wrapper;

import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class EncryptWrapper extends HttpServletRequestWrapper{

	public EncryptWrapper(HttpServletRequest request) {
		super(request);
	
	}

		@Override
		public String getParameter(String key) {
			String value = "";
			
			if(key != null && (key.equals("wguPwd") || key.equals("userPwd"))) {
				value = getSha512(super.getParameter(key));
			} else {
				value = super.getParameter(key);
			}
			
			return value;
		}
		
	
		public static String getSha512(String wguPwd) {
			String encPwd = null;
			
			//sha512방식 암호화 사용 객체
			MessageDigest md = null; 
			
			try {
				md = MessageDigest.getInstance("SHA-512");
			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
			}
		
			byte[] bytes = wguPwd.getBytes(Charset.forName("UTF-8"));
			md.update(bytes);
			
			encPwd = Base64.getEncoder().encodeToString(md.digest());
			
			return encPwd;
		}
}
