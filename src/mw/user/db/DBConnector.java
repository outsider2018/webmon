package mw.user.db;

import java.sql.*;
import org.apache.log4j.Logger;
import org.apache.derby.jdbc.*;


public class DBConnector {
	static Logger logger = Logger.getLogger(DBConnector.class.getName());
	
//	static String driver = "org.apache.derby.jdbc.EmbeddedDriver";	
	
	static String dbName="MonDB";
	static String connectionURL = "jdbc:derby:D:/workspace-oxygen/webmon/WebContent/derby/datafile/" + dbName;
//	static String connectionURL = "jdbc:derby://localhost:1527/" + dbName + ";create=false";
	
	public static Connection getConnection(){
		
		Connection conn = null;
		
	    try {
	        conn = DriverManager.getConnection(connectionURL);
	        System.out.println("Connected to database : " + dbName);
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
