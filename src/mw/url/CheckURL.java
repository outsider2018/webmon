package mw.url;

import java.io.*;
import java.net.*;
import java.util.*;

public class CheckURL {
	public ArrayList<HashMap> checkUrl(ArrayList<String> urlList){
		ArrayList<HashMap> resultList = new ArrayList<HashMap>();
		HashMap<String, String> resultMap = new HashMap<String, String>();	

		HttpURLConnection conn = null;
		int httpStatusCode = -1;
		String message = "";
		int ConnectionTimeout = 1000;
		StringBuilder sb = new StringBuilder();
		
		String group = "";
		String type = "";
		String number = "";
		String flag = "";
		String url = "";
		String name = "";
		long responseTime = 0;
		
		for(String server : urlList){
			String[] servers = server.split(",");
			
			group = servers[0];
			type = servers[1];
			number = servers[2];
			flag = servers[3];
			name = servers[4];
			url = servers[5];
			httpStatusCode = -1;
			message = "";
			
			if(flag.equals("R") || flag.equals("r")){
				resultMap = new HashMap<String, String>();
				resultMap.put("Group", group);
				resultMap.put("Type", type);
				resultMap.put("Number", number);				
				resultMap.put("Name", name);
				resultMap.put("Url", url);
				resultMap.put("StatusCode", "R");
				resultMap.put("ResponseTime", "-");
				resultMap.put("Message", "�꽌鍮꾩뒪 以�鍮� 以�");
				resultList.add(resultMap);			
			}else if(flag.equals("N") || flag.equals("n")){
				resultMap = new HashMap<String, String>();
				resultMap.put("Group", group);
				resultMap.put("Type", type);				
				resultMap.put("Number", number);				
				resultMap.put("Name", name);
				resultMap.put("Url", url);
				resultMap.put("StatusCode", "N");
				resultMap.put("ResponseTime", "-");
				resultMap.put("Message", "�궗�슜�븯吏� �븡�쓬");
				resultList.add(resultMap);
			}else{
				try{
					URL urlObj = new URL(servers[5]);		
					conn = (HttpURLConnection) urlObj.openConnection();	// IOException		
					conn.setRequestMethod("GET");
					conn.setConnectTimeout(ConnectionTimeout);
					
					long startTime = System.currentTimeMillis();
					httpStatusCode = conn.getResponseCode();
					long endTime = System.currentTimeMillis();
					responseTime = endTime - startTime;
	
					message = conn.getResponseMessage();
	
					InputStream is = conn.getInputStream();
					BufferedReader br = new BufferedReader(new InputStreamReader(is));
					String line = null;
					while ((line = br.readLine()) != null) {
						sb.append(line);
						sb.append("\n");
					}
	
				}catch (MalformedURLException e) {
	//				e.printStackTrace();
					e.getMessage();
					message = "Wrong URL(" +url+ ")";
				} catch (UnknownHostException e) {
					e.getMessage();
					message = "Unknown Host Error(" +url+ ")";
				} catch (IOException e) {
					message = "IO Exception(" + e.getMessage() + ")";
					e.getMessage();
				}catch(Exception e){
					message = "Exception(" + e.getMessage() + ")";
					e.getMessage();				
				}finally {
					if (conn != null) {
						conn.disconnect();				
					}				
					resultMap = new HashMap<String, String>();
					resultMap.put("Group", group);
					resultMap.put("Type", type);				
					resultMap.put("Number", number);					
					resultMap.put("Name", name);
					resultMap.put("Url", url);
					resultMap.put("StatusCode", String.valueOf(httpStatusCode));
					resultMap.put("ResponseTime", String.valueOf(responseTime));
					resultMap.put("Message", message);
					resultList.add(resultMap);
				}
			}

		}// for end		

		return resultList;
		
	}
}
