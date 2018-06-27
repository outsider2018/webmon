package mw.scheduler;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.naming.NamingException;

import org.apache.catalina.tribes.util.Arrays;
import org.json.JSONArray;
import org.json.JSONException;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import mw.user.dao.URLDataDAO;
import mw.user.db.DBConnector;
import mw.url.CheckURL;

public class SchChkURL implements Job{
	public void execute(JobExecutionContext arg0)
    throws JobExecutionException{
		runURLChk();
		}
	
	public void runURLChk() {
		
		JSONArray ret = new JSONArray();
		Connection conn = DBConnector.getConnection();
		CheckURL chk = new CheckURL();
		ArrayList<HashMap> resultList = new ArrayList<HashMap>();
		String insertResult ="true";
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
		long starttime = System.currentTimeMillis();
		long endtime;
		
		try {
			ret = URLDataDAO.getChkURL(conn, "PRD");

			resultList = chk.checkUrl(ret);
			for(int i=0; i < resultList.size(); i++) {
				URLDataDAO.insertChkHist(conn, resultList.get(i));
			}
			endtime = System.currentTimeMillis();
			System.out.println("URL 체크 스케줄러 수행시간 : "+(endtime-starttime));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if(conn != null){
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}	
	}
}