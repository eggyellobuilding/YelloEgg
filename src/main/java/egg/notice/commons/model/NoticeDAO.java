package egg.notice.commons.model;

import java.util.HashMap;
import java.util.List;

import egg.notice.commons.model.NoticeDTO;

public interface NoticeDAO {
	public int getNoticeCount();
	public List<NoticeDTO> NoticeList(HashMap<String, String> temp);
	public NoticeDTO Notice(int noticeidx);
	public int readNotice(int noticeidx);
}
