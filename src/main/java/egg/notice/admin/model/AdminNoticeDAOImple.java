package egg.notice.admin.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class AdminNoticeDAOImple implements AdminNoticeDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	
	
	public AdminNoticeDAOImple(SqlSessionTemplate sqlSessionTemplate) {
		super(); 
		this.sqlSessionTemplate = sqlSessionTemplate;
	} 
       

	
	public int getNoticeCount() {
		return sqlSessionTemplate.selectOne("getNoticeCount");
	}

	
	public List<AdminNoticeDTO> getAllList(HashMap<String, String> temp){
		return sqlSessionTemplate.selectList("getAllList", temp);
	}
	
	
	public AdminNoticeDTO getNotice(int noticeidx) {
		return sqlSessionTemplate.selectOne("getNotice", noticeidx);
	}
	 
	
	public int insertNotice(AdminNoticeDTO dto) {
		return sqlSessionTemplate.insert("insertNotice", dto);
	}

	
	public int updateNotice(AdminNoticeDTO dto) {
		return sqlSessionTemplate.update("updateNotice", dto);
	}

	public int delNotice(AdminNoticeDTO dto) {
		return sqlSessionTemplate.delete("delNotice", dto);
	}
}
