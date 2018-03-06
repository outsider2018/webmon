package mw.user.db;

import java.util.ArrayList;
import java.util.Hashtable;

interface IQuerySyntaxParser {
	
	public  ArrayList<String> getPreparedStateParameters(String query_str, Hashtable request_params);
	
	public String parsePreparedStateQuery(String query_str, Hashtable request_params);
	
	public String getLoggableQueryString(String query_str, Hashtable request_params);
}
