package mw.user.db;

import java.net.URLEncoder;
import java.sql.Clob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;
import java.util.Hashtable;

import org.apache.log4j.Logger;
import org.json.JSONArray;
import org.json.JSONObject;

public class DBQueryExcutor{
	public static String STATUS_SUCCESS = "S";
	public static String STATUS_FAILURE = "F";

	static Logger logger = Logger.getLogger(DBConnector.class.getName());

	/**
	 * 
	 * @param conn
	 * @param sequence_name
	 * @return
	 * @throws Exception
	 */
	public static String getSequenceCurrentValue(Connection conn, String sequence_name)  throws Exception{
		String query  = "SELECT "+sequence_name+".NEXTVAL FROM DUAL ";
		return selectSingleString(conn, query, new Hashtable());
	}
	

	/**
	 * 
	 * @param conn
	 * @param push_request_obj
	 * @param reg_id
	 * @throws Exception
	 */
	public static void insertPushRequestStack(Connection conn, JSONObject push_request_obj, boolean send_to_child_yn, String request_from, String request_to, String reqeust_option_value)  throws Exception{
		String query_insertPushStack = ""
				+"\n  INSERT INTO  MTB_ALL_PUSH_REQUEST           "
				+"\n   (                                          "
				+"\n  		PUSH_REQUEST_SEQ                      "
				+"\n  		, PUSH_REQUEST_TYPE                   "
				+"\n  		, REQUEST_OPTION_VALUE                "
				+"\n  		, PARENT_CHILD_TYPE                   "
				+"\n  		, PARENT_CHILD_CODE                   "
				+"\n  		, MESSAGE                             "
				+"\n  		, REG_ID                              "
				+"\n  		, REG_DATE                            "
				+"\n    ) VALUES (                                "
				+"\n                                              "
				+"\n  		:PUSH_REQUEST_SEQ                     "
				+"\n  		, :PUSH_REQUEST_TYPE                  "
				+"\n  		, :REQUEST_OPTION_VALUE               "
				+"\n  		, :PARENT_CHILD_TYPE                  "
				+"\n  		, :PARENT_CHILD_CODE                  "
				+"\n  		, :MESSAGE                            "
				+"\n  		, :REG_ID                             "
				+"\n  		, SYSDATE                             "
				+"\n                                              "
				+"\n    )                                         ";

		String query_insertPushHistory = ""
				+"\n  INSERT INTO  MTB_ALL_PUSH_REQUEST_HISTORY   "
				+"\n   (                                          "
				+"\n  		PUSH_REQUEST_SEQ                      "
				+"\n  		, PUSH_REQUEST_TYPE                   "
				+"\n  		, REQUEST_OPTION_VALUE                "
				+"\n  		, PARENT_CHILD_TYPE                   "
				+"\n  		, PARENT_CHILD_CODE                   "
				+"\n  		, MESSAGE                             "
				+"\n  		, REG_ID                              "
				+"\n  		, REG_DATE                            "
				+"\n    ) VALUES (                                "
				+"\n                                              "
				+"\n  		:PUSH_REQUEST_SEQ                     "
				+"\n  		, :PUSH_REQUEST_TYPE                  "
				+"\n  		, :REQUEST_OPTION_VALUE               "
				+"\n  		, :PARENT_CHILD_TYPE                  "
				+"\n  		, :PARENT_CHILD_CODE                  "
				+"\n  		, :MESSAGE                            "
				+"\n  		, :REG_ID                             "
				+"\n  		, SYSDATE                             "
				+"\n                                              "
				+"\n    )                                         ";

		Hashtable request_params = new Hashtable();
		request_params.put("PUSH_REQUEST_SEQ",     push_request_obj.getString("PUSH_INFO_SEQ"));
		request_params.put("REQUEST_OPTION_VALUE",    reqeust_option_value);
		request_params.put("PUSH_REQUEST_TYPE",    push_request_obj.getString("ACTION_TYPE"));
		request_params.put("PARENT_CHILD_TYPE",    send_to_child_yn?"CHILD":"PARENT");
		request_params.put("PARENT_CHILD_CODE",    request_to);
		request_params.put("MESSAGE",           push_request_obj.toString());
		request_params.put("REG_ID",            request_from);
		
//		if(send_to_child_yn)
		DBQueryExcutor.updateQueryExcutor(conn, query_insertPushStack, request_params);
		
		DBQueryExcutor.updateQueryExcutor(conn, query_insertPushHistory, request_params);
	}

	

	/**
	 * 
	 * @param conn
	 * @param member_id
	 * @return
	 * @throws Exception
	 */
	public static JSONArray getChildCodeList(Connection conn, String member_id)  throws Exception{
		String get_gcmRegistId_query = " SELECT CHILD_CODE FROM MTB_CHILD_INFO WHERE MEMBER_ID = :MEMBER_ID ";
		Hashtable request_params = new Hashtable();
		request_params.put("MEMBER_ID",   member_id);
		JSONObject result = DBQueryExcutor.selectMultiRow(conn, get_gcmRegistId_query, request_params);
		return result.getJSONArray("CHILD_CODE");
//		return result.getJSONArray("MEMBER_ID");
	}
	
	/**
	 * 
	 * @param conn
	 * @param query_raw
	 * @param request_params
	 * @return
	 * @throws Exception
	 */
	public static String selectSingleString(Connection conn, String query_raw, Hashtable request_params)  throws Exception{
		return selectSingleString(conn, query_raw, request_params, true);
	}	

	/**
	 * 
	 * @param conn
	 * @param query_raw
	 * @param request_params
	 * @param logable
	 * @return
	 * @throws Exception
	 */
	public static String selectSingleString(Connection conn, String query_raw, Hashtable request_params, boolean logable)  throws Exception{

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String response_value = "";
		IQuerySyntaxParser query_parser = new NamedQuerySyntaxParser();
		try{
			pstmt = conn.prepareStatement(query_parser.parsePreparedStateQuery(query_raw , request_params));

			if(logable){
				logger.info("\t============= Execute Update Query Information =============");
				logger.info("\t---------- <reqeust parameter list> -------------" );
			}
			ArrayList<String> params = query_parser.getPreparedStateParameters(query_raw, request_params);
			for(int i=0 ; i < params.size() ; i++){
				String key = params.get(i)+"";
				String value = request_params.get(key)+"";
				pstmt.setString(i+1, value);
				if(logable){
					logger.info( "\t"+key+"\t\t"+value );
				}
			}
			if(logable){
				logger.info("\t---------- <Query String> -------------" );
				logger.info("\t" + query_parser.getLoggableQueryString(query_raw, request_params) );
				logger.info("");
			}

			rs = pstmt.executeQuery();

			if(logable){
				logger.info("\t------------------<result String>-------------------------");
			}
			if(rs.next()){
				response_value = rs.getString(1);
				if(response_value == null ){
					response_value = "";
				}
				if(logable){
					logger.info("\t"+response_value);
					logger.info("\n");
				}
			}

		}catch (Exception e) {
			throw e;
		}finally{
			DBConnector.releaseConnection(pstmt, rs);
		}
		return response_value;
	}

	/**
	 * 
	 * @param conn
	 * @param query_raw
	 * @param request_params
	 * @return
	 * @throws Exception
	 */
	public static JSONObject selectSingleRow(Connection conn, String query_raw, Hashtable request_params)  throws Exception{
		return selectSingleRow(conn, query_raw, request_params, true);
	}

	/**
	 * 
	 * @param conn
	 * @param query_raw
	 * @param request_params
	 * @param logable
	 * @return
	 * @throws Exception
	 */
	public static JSONObject selectSingleRow(Connection conn, String query_raw, Hashtable request_params, boolean logable)  throws Exception{

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		JSONObject response_value = new JSONObject();
		IQuerySyntaxParser query_parser = new NamedQuerySyntaxParser();
		try{
			pstmt = conn.prepareStatement(query_parser.parsePreparedStateQuery(query_raw, request_params));

			if(logable){
				logger.info("\t============= Execute Update Query Information =============");
				logger.info("\t---------- <reqeust parameter list> -------------" );
			}
			ArrayList<String> params = query_parser.getPreparedStateParameters(query_raw, request_params);
			for(int i=0 ; i < params.size() ; i++){
				String key = params.get(i)+"";
				String value = request_params.get(key)+"";
				pstmt.setString(i+1, value);
				if(logable){
					logger.info( "\t"+key+"\t\t"+value );
				}
			}
			if(logable){
				logger.info("\t---------- <Query String> -------------" );
				logger.info("\t" + query_parser.getLoggableQueryString(query_raw, request_params) );
				logger.info("");
			}

			rs = pstmt.executeQuery();

			ResultSetMetaData rsmd = rs.getMetaData();
			int resultCount = 0;

			if(logable){
				logger.info("\t------------------<result set>-------------------------");
			}
			if(rs.next()){
				String result_line = "";
				for(int i=1 ; i <= rsmd.getColumnCount() ; i++){
					String value = "";
					if(rsmd.getColumnType(i) == java.sql.Types.CLOB){
						Clob clobValue = rs.getClob(rsmd.getColumnName(i));
						value = clobValue.getSubString(1, (int) clobValue.length());
					}else{
						value = rs.getString(i);
					}
					if(value == null ){
						value = "";
					}
					response_value.put(rsmd.getColumnName(i), value);
					result_line += "\t" + rs.getString(i);
				}
				if(logable){
					logger.info("\t"+result_line);
				}
				response_value.put("RESULT_COUNT", rs.getFetchSize()+"");
			}else{
				response_value.put("RESULT_COUNT", "0");
			}
			if(logable){
				logger.info( "\t Execute Query Result Count : " + String.valueOf( resultCount ));
				logger.info("\n");
			}

		}catch (Exception e) {
			throw e;
		}finally{
			DBConnector.releaseConnection(pstmt, rs);
		}
		return response_value;
	}

	/**
	 * 
	 * @param conn
	 * @param query_raw
	 * @param request_params
	 * @return
	 * @throws Exception
	 */
	public static JSONObject selectMultiRow(Connection conn, String query_raw, Hashtable request_params)  throws Exception{
		return selectMultiRow(conn, query_raw, request_params, true);
	}

	/**
	 * 
	 * @param conn
	 * @param query_raw
	 * @param request_params
	 * @param logable
	 * @return
	 * @throws Exception
	 */
	public static JSONObject selectMultiRow(Connection conn, String query_raw, Hashtable request_params, boolean logable)  throws Exception{

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		JSONObject response_value = new JSONObject();
		IQuerySyntaxParser query_parser = new NamedQuerySyntaxParser();
		try{
			String prepared_query = query_parser.parsePreparedStateQuery(query_raw, request_params);
			pstmt = conn.prepareStatement(prepared_query);

			if(logable){
				logger.info("\t============= Execute Update Query Information =============");
				logger.info("\t---------- <reqeust parameter list> -------------" );
			}

			ArrayList<String> params = query_parser.getPreparedStateParameters(query_raw, request_params);
			for(int i=0 ; i < params.size() ; i++){
				String key = params.get(i)+"";
				String value = request_params.get(key)+"";
				pstmt.setString(i+1, value);
				if(logable){
					logger.info( "\t"+key+"\t\t"+value );
				}  
			}
			if(logable){
				logger.info("\t---------- <Query String> -------------" );
				logger.info("\t" + query_parser.getLoggableQueryString(query_raw, request_params) );
				logger.info("");
			}

			rs = pstmt.executeQuery();

			ResultSetMetaData rsmd = rs.getMetaData();
			int resultCount = 0;

			JSONArray[] result_arr = new JSONArray[rsmd.getColumnCount()];

			for(int i=0 ; i < rsmd.getColumnCount() ; i++){
				result_arr[i] = new JSONArray();
			}
			if(logable){
				logger.info("\t------------------<result set>-------------------------");
			}

			
			while(rs.next()){
				resultCount ++;
				String result_line = "";
				result_line = resultCount + ". \t";
				for(int i=1 ; i <= rsmd.getColumnCount() ; i++){
					String value = rs.getString(i);
					if(value == null ){
						value = "";
					}
					result_arr[i-1].put( value);
					result_line += "\t" + rs.getString(i);
				}
				if(logable){
					logger.info("\t"+result_line);
				}
			}

			response_value.put("RESULT_COUNT", String.valueOf( resultCount ));
			
			for(int i=1 ; i <= rsmd.getColumnCount() ; i++){
				response_value.put(rsmd.getColumnName(i), result_arr[i-1]);
			}
			if(logable){
				logger.info( "\t Execute Query Result Count : " + String.valueOf( resultCount ));
				logger.info("\n");
			}

		}catch (Exception e) {
			throw e;
		}finally{
			DBConnector.releaseConnection(pstmt, rs);
		}
		return response_value;
	}
	
	/**
	 * 
	 * @param conn
	 * @param query_raw
	 * @param request_params
	 * @return
	 * @throws Exception
	 */
	public static JSONObject selectMultiRow_web(Connection conn, String query_raw, Hashtable request_params)  throws Exception{
		return selectMultiRow_web(conn, query_raw, request_params, true);
	}
	
	/**
	 * 
	 * @param conn
	 * @param query_raw
	 * @param request_params
	 * @param logable
	 * @return
	 * @throws Exception
	 */
	public static JSONObject selectMultiRow_web(Connection conn, String query_raw, Hashtable request_params, boolean logable)  throws Exception{
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		JSONObject response_value = new JSONObject();
		IQuerySyntaxParser query_parser = new NamedQuerySyntaxParser();
		try{
			String prepared_query = query_parser.parsePreparedStateQuery(query_raw, request_params);
			pstmt = conn.prepareStatement(prepared_query);
			
			if(logable){
				logger.info("\t============= Execute Update Query Information =============");
				logger.info("\t---------- <reqeust parameter list> -------------" );
			}
			
			ArrayList<String> params = query_parser.getPreparedStateParameters(query_raw, request_params);
			for(int i=0 ; i < params.size() ; i++){
				String key = params.get(i)+"";
				String value = request_params.get(key)+"";
				pstmt.setString(i+1, value);
				if(logable){
					logger.info( "\t"+key+"\t\t"+value );
				}
			}
			if(logable){
				logger.info("\t---------- <Query String> -------------" );
				logger.info("\t" + query_parser.getLoggableQueryString(query_raw, request_params) );
				logger.info("");
			}
			
			rs = pstmt.executeQuery();
			
			ResultSetMetaData rsmd = rs.getMetaData();
			int resultCount = 0;
			
			
			if(logable){
				logger.info("\t------------------<result set>-------------------------");
			}

		    JSONArray result_arr = new JSONArray();
			
			while(rs.next()){
				resultCount ++;
				String result_line = "";
				result_line = resultCount + ". \t";

			     JSONObject row_obj = new JSONObject();
				for(int i=1 ; i <= rsmd.getColumnCount() ; i++){
					 String value = "";
					if(rsmd.getColumnType(i) == java.sql.Types.CLOB){
						Clob clobValue = rs.getClob(rsmd.getColumnName(i));
						value = clobValue.getSubString(1, (int) clobValue.length());
					}else{
						value = rs.getString(rsmd.getColumnName(i));
					}
					if(value == null ){
						value = "";
					}
					row_obj.put(rsmd.getColumnName(i), value == null?"":value.trim());
					result_line += "\t" +value;
				}
//				resultCount++;
			      result_arr.put(row_obj);
			      
				if(logable){
					logger.info("\t"+result_line);
				}
			}
			// 2018.02.17 lee hwanho
			//response_value.put("size", resultCount);
			//response_value.put("resultSet", result_arr);
			if(logable){
				logger.info( "\t Execute Query Result Count : " + String.valueOf( resultCount ));
				logger.info("\n");
			}
			
		}catch (Exception e) {
			throw e;
		}finally{
			DBConnector.releaseConnection(pstmt, rs);
		}
		return response_value;
	}
	
	/**
	 * 
	 * @param conn
	 * @param query_raw
	 * @param request_params
	 * @return
	 * @throws Exception
	 */
	public static JSONObject updateQueryExcutor(Connection conn, String query_raw, Hashtable request_params)  throws Exception{
		return updateQueryExcutor(conn, query_raw, request_params, true);
	}
	
	/**
	 * 
	 * @param conn
	 * @param query_raw
	 * @param request_params
	 * @param logable
	 * @return
	 * @throws Exception
	 */
	public static JSONObject updateQueryExcutor(Connection conn, String query_raw, Hashtable request_params, boolean logable)  throws Exception{

		JSONObject response_value = new JSONObject();
		PreparedStatement pstmt = null;
		String status_value = STATUS_FAILURE;
		IQuerySyntaxParser query_parser = new NamedQuerySyntaxParser();
		try{
			pstmt = conn.prepareStatement(query_parser.parsePreparedStateQuery(query_raw , request_params));

			if(logable){
				logger.info("\t============= Execute Update Query Information =============");
				logger.info( "\t---------- <reqeust parameter list> -------------" );
			}
			ArrayList<String> params = query_parser.getPreparedStateParameters(query_raw, request_params);			
			for(int i=0 ; i < params.size() ; i++){								
				String key = params.get(i)+"";
				String value = request_params.get(key)+"";
				pstmt.setString(i+1, value);
				if(logable){
					logger.info( "\t"+key+"\t\t"+value );
				}
			}

			if(logable){
				logger.info( "\t---------- <Query String> -------------" );
				logger.info("\t" + query_parser.getLoggableQueryString(query_raw, request_params) );
				logger.info("");
			}

			int result = pstmt.executeUpdate();
			System.out.println("update result : "+result);

			if(logable){
				logger.info("\t------------------<result>-------------------------");
				logger.info( "\t Execute Query Result Status : " + result);
				logger.info("\n");
			}

			if(result >= 0){
				status_value = STATUS_SUCCESS;
			}
		}catch (Exception e) {
			throw e;
		}finally{
			DBConnector.releaseConnection(pstmt);
		}

		try{
			JSONObject jo = new JSONObject();
			JSONArray result_set = new JSONArray();
			jo.put("REG_YN", status_value);
			jo.put("STATUS", status_value);
			result_set.put(jo);
			response_value.put("size", "1");
			response_value.put("resultSet", result_set);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return response_value;
	}

}
