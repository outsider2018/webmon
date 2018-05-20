package mw.user.db;

import java.sql.*;
import org.apache.log4j.Logger;
import org.apache.derby.jdbc.*;


public class DBConnector {
	static Logger logger = Logger.getLogger(DBConnector.class.getName());
	
	static String dbName="MonDB";
	
//	static String connectionURL = "jdbc:derby:../../derby/datafile/" + dbName;
//	static String connectionURL = "jdbc:derby:D:/workspace-oxygen/webmon/WebContent/derby/datafile/" + dbName;
	static String connectionURL = "jdbc:derby://localhost:1527/" + dbName + ";create=true";
	
	public static Connection getConnection(){
		
		Connection conn = null;
		
/*
 * 	   2018.05.16 WAS embedded derby DB 접속 시
	    try {
	        conn = DriverManager.getConnection(connectionURL);
	        System.out.println("Connected to database : " + dbName);
	    }catch (Exception e) {
	    	System.out.println("DB connection fail!!");
	    	System.out.println(e.getMessage());	    	
	    }
*/
		
/*
 * 		2018.05.16 Derby DB Server 접속 시 		
 */
		org.apache.derby.jdbc.ClientDataSource ds = new org.apache.derby.jdbc.ClientDataSource();
		try {						
			ds.setDatabaseName("MonDB");
			ds.setCreateDatabase("false");
			// The host on which Network Server is running
			ds.setServerName("localhost");
			// The port on which Network Server is listening
			ds.setPortNumber(1527);
			conn = ds.getConnection();
		}catch (Exception e) {
	    	System.out.println("DB connection fail!!");
	    	System.out.println(e.getMessage());	   			
		}
		
	    return conn;
	}
	
	public static void releaseConnection(PreparedStatement pstmt){
		releaseConnection(pstmt, null);
	}

	public static void releaseConnection(PreparedStatement pstmt, ResultSet resultSet){
		releaseConnection(null, pstmt, resultSet);
	}
	public static void releaseConnection(Connection con, PreparedStatement pstmt){
		releaseConnection(con, pstmt, null);
	}


	public static void releaseConnection(Connection con, PreparedStatement pstmt, ResultSet resultSet){
		try{	
			if(resultSet != null){ 
				try { 
					resultSet.close(); 
					resultSet = null; 
				} catch (SQLException e) {
					e.printStackTrace();
				} 
			}

			if(pstmt != null){ 
				try { 
					pstmt.close(); 
					pstmt = null; 
				} catch (SQLException e) {
					e.printStackTrace();
				} 
			}

			if(con != null){ 
				try { 
					con.close(); 
					con = null;
				} catch (SQLException e) { 
					e.printStackTrace();
				} 
			}
			System.out.println(" Release Complete");
			logger.info(" Release Complete");
		}catch (Exception e) {
			e.printStackTrace();
		}
	}    

}
