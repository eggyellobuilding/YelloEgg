package egg.commons;

public class PageModule {

public static String makePage(String pagename, int totalcnt, int listsize, int pagesize, int cp) {
		
		StringBuffer sb=new StringBuffer();

		int totalpage = totalcnt/listsize+1;
		if(totalcnt%listsize==0)totalpage--;		

		int usergroup = cp/pagesize;
		if(cp%pagesize==0)usergroup--;		
		
		 int startpage = usergroup*pagesize+1;
		 int endpage = usergroup*pagesize+pagesize;
		 
		 if(endpage > totalpage) {
		      endpage = totalpage;
		    }
		 
		if (startpage < pagesize) {
			sb.append(
					"<li class='disabled'><a href='#' aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a></li>");
		} else {
			sb.append("<li class=''><a href='"+pagename+"?cp=");
			sb.append(startpage - pagesize);
			sb.append("' aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a></li>");
		}
		
		
		for(int i =  startpage ; i<= endpage ; i++){
			 if(i == cp) {
			        sb.append("<li class='active'><a href='#'>");
			        sb.append(i);
			        sb.append("<span class='sr-only'>");
			        sb.append(i);
			        sb.append("</span></a></li>");
			      } else {
			        sb.append("<li class=''><a href='"+pagename+"?cp=");
			        sb.append(i);
			        sb.append("'>");
			        sb.append(i);
			        sb.append("<span class='sr-only'>");
			        sb.append(i);
			        sb.append("</span></a></li>");
			      }
		}
		
		  if(endpage < totalpage) {
		      sb.append("<li class=''><a href='"+pagename+"?cp=");
		      sb.append(startpage + pagesize);
		      sb.append("' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a></li>");
		    } else {
		      sb.append("<li class='disabled'><a href='#' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a></li>");
		    }
		  
		return sb.toString();
	}
}
