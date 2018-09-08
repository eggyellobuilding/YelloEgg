package egg.store.admin.model;

import java.util.List;

public interface AdminStoreDAO {

	public int adminStoreadd(AdminStoreDTO dto);
	public int getTotalcnt();
	public List<AdminStoreDTO>adminstorelist(int cp,int ls);
	public int adminStoreDelete(int storeIdx);
	
}
