package egg.commons;

import java.text.SimpleDateFormat;
import java.util.*;

public class GetCalendar {

	public String getTime() {
		Calendar cal = Calendar.getInstance();
		int h = cal.get(Calendar.HOUR);
		int m = cal.get(Calendar.MINUTE);
		return h + ":" + m ;
	}
	
	public int getStartTime() {
		Calendar cal = Calendar.getInstance();
		int h = cal.get(Calendar.HOUR);
		int hm=h*60;
		int m = cal.get(Calendar.MINUTE);
		int startTime = hm+m/30;
		return startTime ;
	}
	
	public String getMonth() {
		Calendar cal = Calendar.getInstance();
		int y = cal.get(Calendar.YEAR);
		int m = cal.get(Calendar.MONTH) + 1;
		return y + "-" + m ;
	}
	
	public String getDay() {
		Calendar cal = Calendar.getInstance();
		int y = cal.get(Calendar.YEAR);
		int m = cal.get(Calendar.MONTH) + 1;
		int d = cal.get(Calendar.DATE);
		return y + "-" + m + "-" + d ;
	}
	public String saveTime() {
		Calendar cal = Calendar.getInstance();
		int h = cal.get(Calendar.HOUR);
		int m = cal.get(Calendar.MINUTE);
		int s = cal.get(Calendar.SECOND);
		return ""+h + m + s;
	}
	
	public String getDateDay(String date, String dateType) throws Exception {
		 
	     
	    String day = "" ;
	     
	    SimpleDateFormat dateFormat = new SimpleDateFormat(dateType) ;
	    Date nDate = dateFormat.parse(date) ;
	     
	    Calendar cal = Calendar.getInstance() ;
	    cal.setTime(nDate);
	     
	    int dayNum = cal.get(Calendar.DAY_OF_WEEK) ;
	     
	     
	     
	    switch(dayNum){
	        case 1:
	            day = "일";
	            break ;
	        case 2:
	            day = "월";
	            break ;
	        case 3:
	            day = "화";
	            break ;
	        case 4:
	            day = "수";
	            break ;
	        case 5:
	            day = "목";
	            break ;
	        case 6:
	            day = "금";
	            break ;
	        case 7:
	            day = "토";
	            break ;
	             
	    }
	     
	     
	     
	    return day ;
	}

}
