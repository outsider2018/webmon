package mw.ssl;

import java.net.URL;
import java.security.cert.*;
import javax.net.ssl.*;
import mw.common.*;

public class GetCertificateInfo {
	
	public void getCertificate(String url) throws Exception{ 
		URL targetURL = new URL(url);
		HttpsURLConnection conn = (HttpsURLConnection)targetURL.openConnection();
		CommonLib comm = new CommonLib();
		boolean certValid = true;

		try{
			
			// 인증서 요청을 위해 연결 후 Timeout 설정
			conn.setConnectTimeout(10000);
			conn.setReadTimeout(10000);
			
			conn.connect();
			
			// 인증서 가져오기
			Certificate[] certs = conn.getServerCertificates();
			
			Certificate cert = certs[0];
			System.out.println("Certificate : " + cert);
			if(cert instanceof X509Certificate){
				try{
					((X509Certificate) cert).checkValidity();
//					System.out.println("시작 날짜 : " +comm.dateFormat(((X509Certificate) cert).getNotBefore()));
//					System.out.println("만료 날짜 : " +comm.dateFormat(((X509Certificate) cert).getNotAfter()));
				}catch (CertificateExpiredException cee){
					System.out.println("Certificate is expired");
				}
			}
		}catch(Exception e){
			System.out.println("에러 : "+e);
		}finally{
			conn.disconnect();
		}

	}

}
