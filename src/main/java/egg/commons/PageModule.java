package egg.commons;

public class PageModule {

	public static String makepage(String pagename, int totalcnt, int listsize, int pagesize, int cp) {

		StringBuffer sb = new StringBuffer();

		int totalpage = totalcnt / listsize + 1;
		if (totalcnt % listsize == 0)
			totalpage--;

		int usergroup = cp / pagesize;
		if (cp % pagesize == 0)
			usergroup--;

		if (usergroup != 0) {
			sb.append("<a href='");
			sb.append(pagename);
			sb.append("?cp=");
			int temp = (usergroup - 1) * pagesize + pagesize;
			sb.append(temp);
			sb.append("'>&lt;&lt;</a>");
		}

		for (int i = (usergroup * pagesize + 1); i <= usergroup * pagesize + pagesize; i++) {
			sb.append("&nbsp;&nbsp;<a href='");
			sb.append(pagename);
			sb.append("?cp=");
			sb.append(i);
			sb.append("'>");
			sb.append(i);
			sb.append("</a>&nbsp;&nbsp;");

			if (i == totalpage)
				break;
		}

		if (usergroup != (totalpage / pagesize - (totalpage % pagesize == 0 ? 1 : 0))) {
			sb.append("<a href='");
			sb.append(pagename);
			sb.append("?cp=");
			int temp = (usergroup + 1) * pagesize + 1;
			sb.append(temp);
			sb.append("'>&gt;&gt;</a>");
		}
		return sb.toString();
	}

}
