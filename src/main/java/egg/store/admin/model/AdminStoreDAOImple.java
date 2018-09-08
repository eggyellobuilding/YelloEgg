package egg.store.admin.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class AdminStoreDAOImple implements AdminStoreDAO {
	private SqlSessionTemplate sqlmap;
	
	 
	public AdminStoreDAOImple(SqlSessionTemplate sqlmap) {
		super();
		this.sqlmap = sqlmap;
	}


	public int adminStoreadd(AdminStoreDTO dto) {
		
		int result=sqlmap.insert("storeAdd",dto);
		return result;
	}
	public List<AdminStoreDTO>adminstorelist(int cp,int ls){
		Map data=new HashMap();
		int startnum=(cp-1)*ls+1;
		int endnum=cp*ls;
		data.put("startnum", startnum);
		data.put("endnum", endnum);
		List<AdminStoreDTO> list=sqlmap.selectList("pageStoreList",data);
		return list;
	}
	public int adminStoreDelete(int storeIdx) {
		return sqlmap.update("storeupdate", storeIdx);
	}
	public int getTotalcnt() {
		int cnt=sqlmap.selectOne("totalcnt");
		return cnt;
	}
}
