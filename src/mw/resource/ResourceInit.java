package mw.resource;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import java.io.PrintWriter;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;

import org.apache.derby.drda.*;

public class ResourceInit implements ServletContextListener {
	public static ArrayList<String> urlListTRN = new ArrayList<String>();
	public static ArrayList<String> urlListPRD_PA3_ALL= new ArrayList<String>();
	ResourceBundle rbPRD_PA3_ALL = ResourceBundle.getBundle("PRD_PA3_ALL");
	
	Iterator<String> it = null;
	
	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		
		// Apache Derby Network DB start
		try {
			NetworkServerControl server = new NetworkServerControl(InetAddress.getByName("localhost"),1527);
			server.start(null);
			System.out.println("Apache Derby DB start");
		} catch (UnknownHostException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		// TODO Auto-generated method stub	
				
		// PRD_PA3 Env list load 
		it = rbPRD_PA3_ALL.keySet().iterator();
		while(it.hasNext()){
			String key = it.next();
			String value = rbPRD_PA3_ALL.getString(key);
			urlListPRD_PA3_ALL.add(value);
		}
		Collections.sort(urlListPRD_PA3_ALL);
	    
	}
		
	
	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub		
	}
	
}
