package mw.user.db;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class NamedQuerySyntaxParser implements IQuerySyntaxParser {

	@Override
	public ArrayList<String> getPreparedStateParameters(String query_str, Hashtable request_params) {
		ArrayList<String> param_list = new ArrayList<String>();
		String regex = "\\:[a-zA-Z0-9\\_\\-]*";
		Pattern p = Pattern.compile(regex, Pattern.CASE_INSENSITIVE);
		Matcher m =  p.matcher( query_str );
		for( int i = 0; m.find(i); i = m.end()){
			String key = m.group().substring(1, m.group().length());
			if(request_params.containsKey(key)){
				param_list.add(key);
			}
		}
		return param_list;
	}

	@Override
	public String parsePreparedStateQuery(String query_str, Hashtable request_params) {
		// TODO Auto-generated method stub
		String query = query_str;
		Enumeration<String> pair_list = request_params.keys();
		while(pair_list.hasMoreElements()){
			String key = pair_list.nextElement();
			query = query.replaceAll(":"+key, "?");
		}
		
		return query;
	}

	@Override
	public String getLoggableQueryString(String query_str, Hashtable request_params) {
		Enumeration<String> pair_list = request_params.keys();
		while(pair_list.hasMoreElements()){
			String key = pair_list.nextElement();
			try{
				if(key != null && request_params.containsKey(key)){
					query_str = query_str.replaceAll(":"+key, "'"+request_params.get(key)+"'");
				}
			}catch (Exception e) {}
		}
		return query_str;
	}

}
