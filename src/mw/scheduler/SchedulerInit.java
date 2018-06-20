package mw.scheduler;

//import java.io.PrintStream;
import java.util.Date;
import java.util.ResourceBundle;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.quartz.CronScheduleBuilder;
import org.quartz.CronTrigger;
import org.quartz.JobBuilder;
import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.TriggerBuilder;
import org.quartz.impl.StdSchedulerFactory;


public class SchedulerInit extends HttpServlet
{
  private StdSchedulerFactory schedFact;
  private Scheduler sched;

  public void init(ServletConfig config)
    throws ServletException
  {  
    try
    {
    	ResourceBundle getProperties = ResourceBundle.getBundle("scheduler");		
		String cronScheduleTime = (String)getProperties.getString("cron.schedule.time");
		System.out.println("setup cronTime : "+cronScheduleTime);
    	
		this.schedFact = new StdSchedulerFactory();
		this.sched = this.schedFact.getScheduler();

		JobDetail job1 = JobBuilder.newJob(URLChk.class)
        .withIdentity("URLChk", "group1")
        .build();
		
		CronTrigger expireCert = (CronTrigger)TriggerBuilder.newTrigger()
        .withIdentity("TRIGGER", "group1")
        .withSchedule(CronScheduleBuilder.cronSchedule(cronScheduleTime))
        .build();

		this.sched.start();

		Date executeUpdater_ft = this.sched.scheduleJob(job1, expireCert);
		System.out.println(job1.getKey() + " has been scheduled to run at: " + job1 + " and repeat based on expression: " +  expireCert.getCronExpression());
    }
    catch (SchedulerException e) {
      e.printStackTrace();
    } catch (Exception e) {
      e.printStackTrace();
    }
  }

  protected void doGet(HttpServletRequest req, HttpServletResponse resp) {
    doPost(req, resp);
  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response)
  {
  }

  public void destroy() {
    try {
      this.sched.shutdown();
    } catch (SchedulerException e) {
      e.printStackTrace();
    }
  }
}									