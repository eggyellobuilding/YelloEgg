package egg.notice.admin.model;
import java.util.*;
public interface AdminNoticeDAO {
	public int getNoticeCount();
	public List<AdminNoticeDTO> getAllList(HashMap<String, String> temp);
	public AdminNoticeDTO getNotice(int noticeidx);
	public int insertNotice(AdminNoticeDTO dto);
	public int updateNotice(AdminNoticeDTO dto); 
	public int delNotice(AdminNoticeDTO dto);
}
     