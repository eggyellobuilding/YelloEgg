package egg.notice.commons.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class NoticeDAOImple implements NoticeDAO {
	
	public NoticeDAOImple(SqlSessionTemplate sqlSessionTemplate) {
		super();
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public int getNoticeCount() {
		return sqlSessionTemplate.selectOne("getNoticeCount");
	}

	public List<NoticeDTO> NoticeList(HashMap<String, String> temp) {
		return sqlSessionTemplate.selectList("NoticeList", temp);
	}

	public NoticeDTO Notice(int noticeidx) {
		return sqlSessionTemplate.selectOne("Notice", noticeidx);
	}
	public int readNotice(int noticeidx) {
		return sqlSessionTemplate.update("plusReadnum",noticeidx);
	}

}
