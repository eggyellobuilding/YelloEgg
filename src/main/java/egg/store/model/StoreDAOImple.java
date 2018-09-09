package egg.store.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class StoreDAOImple implements StoreDAO {
	private SqlSessionTemplate sqlMap;

	public StoreDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	public List<StoreDTO> ticket() {
		List<StoreDTO> dtos = sqlMap.selectList("storeTicket");
		return dtos;
	}
	public List<StoreDTO> event() {
		List<StoreDTO> dtos = sqlMap.selectList("storeEvent");
		return dtos;
	}
	public List<StoreDTO> accessories() {
		List<StoreDTO> dtos = sqlMap.selectList("storeAccessories");
		return dtos;
	}
	public List<StoreDTO> popcorn() {
		List<StoreDTO> dtos = sqlMap.selectList("storePopcorn");
		return dtos;
	}
	public List<StoreDTO> memberInfo(int midx) {
		List<StoreDTO> dtos = sqlMap.selectList("storePayment",midx);
		return dtos;
	}
	public int storePaymileage(int midx) {
		
		int result = 0;
		try {
			result = sqlMap.selectOne("storePayMileage",midx);
		}catch (NullPointerException e) {
			return 0;
		}
		return result;
	}
	public void paymentOk(StoreDTO dto) {
		sqlMap.insert("storePaymentAdd",dto);
		sqlMap.insert("smileageAdd",dto);
	}
	public int storeIdx(int storePayStoreIdx) {
		int result = sqlMap.selectOne("storeIdx",storePayStoreIdx);
		return result;
	}
	public int storePayIdx(int storePayMemberIdx) {
		int result = sqlMap.selectOne("storePayIdx",storePayMemberIdx);
		return result;
	}
	public List<StoreDTO> paymentOkForm(StoreDTO dto) {
		List<StoreDTO> lists = sqlMap.selectList("paymentOkForm",dto);
		return lists;
	}
	public void grade(int mileageIdx) {
		int mileageMoney = sqlMap.selectOne("gradecheck",mileageIdx);

		if(mileageMoney >= 10000 && mileageMoney <= 19999) {
			sqlMap.update("grade2",mileageIdx);
		}else if(mileageMoney >= 20000) {
			sqlMap.update("grade3",mileageIdx);
		}
	}
}
