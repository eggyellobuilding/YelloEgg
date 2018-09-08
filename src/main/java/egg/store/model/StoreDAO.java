package egg.store.model;

import java.util.List;

public interface StoreDAO {
	
	public List<StoreDTO> ticket(); 
	public List<StoreDTO> event();
	public List<StoreDTO> accessories();
	public List<StoreDTO> popcorn();
	public int storePaymileage(int midx);
	public List<StoreDTO> memberInfo(int sidx);
	public void paymentOk(StoreDTO dto);
	public int storePayIdx(int storePayMemberIdx);
	public int storeIdx(int storePayStoreIdx);
	public List<StoreDTO> paymentOkForm(StoreDTO dto);
	public void grade(int mileageIdx);
}
