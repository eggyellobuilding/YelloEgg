package egg.store.model;

import java.sql.Date;

public class StoreDTO {
	
	/** 스토어 정보 */
	private int storeIdx;
	private String storeName;
	private String storeImg;
	private int storeCount;
	private String storeCtg;
	private int storePrice;
	private Date storeDate;
	private String storeState;
	private String storeInfo;
	
	/** 스토어 결제정보 */
	private int storePayIdx;
	private Date storePayDate;
	private String storePayCard;
	private int storePayMileage;
	private int storePayCount;
	private String storePayState;
	private int storePayMemberIdx;
	private int storePayStoreIdx;
	private int storePayMoney;
	
	/** 마일리지 정보 */
	private int mileageIdx;
	private int mileagePrice;
	private String mileageReason;
	private int memberIdx;
	
	/** 구매자 정보 */
	private String id;
	private String email;
	private String tel;
	
	/** 재료 */
	private String sPayCount;
	private String sPayMoney;
	private String milPrice;
	private String mIdx;
	private int payMoney;
	
	public StoreDTO() {
		super();
	}

	public StoreDTO(int storeIdx, String storeName, String storeImg, int storeCount, String storeCtg, int storePrice,
			Date storeDate, String storeState, String storeInfo, int storePayIdx, Date storePayDate,
			String storePayCard, int storePayMileage, int storePayCount, String storePayState, int storePayMemberIdx,
			int storePayStoreIdx, int storePayMoney, int mileageIdx, int mileagePrice, String mileageReason,
			int memberIdx, String id, String email, String tel, String sPayCount, String sPayMoney, String milPrice,
			String mIdx, int payMoney) {
		super();
		this.storeIdx = storeIdx;
		this.storeName = storeName;
		this.storeImg = storeImg;
		this.storeCount = storeCount;
		this.storeCtg = storeCtg;
		this.storePrice = storePrice;
		this.storeDate = storeDate;
		this.storeState = storeState;
		this.storeInfo = storeInfo;
		this.storePayIdx = storePayIdx;
		this.storePayDate = storePayDate;
		this.storePayCard = storePayCard;
		this.storePayMileage = storePayMileage;
		this.storePayCount = storePayCount;
		this.storePayState = storePayState;
		this.storePayMemberIdx = storePayMemberIdx;
		this.storePayStoreIdx = storePayStoreIdx;
		this.storePayMoney = storePayMoney;
		this.mileageIdx = mileageIdx;
		this.mileagePrice = mileagePrice;
		this.mileageReason = mileageReason;
		this.memberIdx = memberIdx;
		this.id = id;
		this.email = email;
		this.tel = tel;
		this.sPayCount = sPayCount;
		this.sPayMoney = sPayMoney;
		this.milPrice = milPrice;
		this.mIdx = mIdx;
		this.payMoney = payMoney;
	}

	public int getStoreIdx() {
		return storeIdx;
	}

	public void setStoreIdx(int storeIdx) {
		this.storeIdx = storeIdx;
	}

	public String getStoreName() {
		return storeName;
	}

	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}

	public String getStoreImg() {
		return storeImg;
	}

	public void setStoreImg(String storeImg) {
		this.storeImg = storeImg;
	}

	public int getStoreCount() {
		return storeCount;
	}

	public void setStoreCount(int storeCount) {
		this.storeCount = storeCount;
	}

	public String getStoreCtg() {
		return storeCtg;
	}

	public void setStoreCtg(String storeCtg) {
		this.storeCtg = storeCtg;
	}

	public int getStorePrice() {
		return storePrice;
	}

	public void setStorePrice(int storePrice) {
		this.storePrice = storePrice;
	}

	public Date getStoreDate() {
		return storeDate;
	}

	public void setStoreDate(Date storeDate) {
		this.storeDate = storeDate;
	}

	public String getStoreState() {
		return storeState;
	}

	public void setStoreState(String storeState) {
		this.storeState = storeState;
	}

	public String getStoreInfo() {
		return storeInfo;
	}

	public void setStoreInfo(String storeInfo) {
		this.storeInfo = storeInfo;
	}

	public int getStorePayIdx() {
		return storePayIdx;
	}

	public void setStorePayIdx(int storePayIdx) {
		this.storePayIdx = storePayIdx;
	}

	public Date getStorePayDate() {
		return storePayDate;
	}

	public void setStorePayDate(Date storePayDate) {
		this.storePayDate = storePayDate;
	}

	public String getStorePayCard() {
		return storePayCard;
	}

	public void setStorePayCard(String storePayCard) {
		this.storePayCard = storePayCard;
	}

	public int getStorePayMileage() {
		return storePayMileage;
	}

	public void setStorePayMileage(int storePayMileage) {
		this.storePayMileage = storePayMileage;
	}

	public int getStorePayCount() {
		return storePayCount;
	}

	public void setStorePayCount(int storePayCount) {
		this.storePayCount = storePayCount;
	}

	public String getStorePayState() {
		return storePayState;
	}

	public void setStorePayState(String storePayState) {
		this.storePayState = storePayState;
	}

	public int getStorePayMemberIdx() {
		return storePayMemberIdx;
	}

	public void setStorePayMemberIdx(int storePayMemberIdx) {
		this.storePayMemberIdx = storePayMemberIdx;
	}

	public int getStorePayStoreIdx() {
		return storePayStoreIdx;
	}

	public void setStorePayStoreIdx(int storePayStoreIdx) {
		this.storePayStoreIdx = storePayStoreIdx;
	}

	public int getStorePayMoney() {
		return storePayMoney;
	}

	public void setStorePayMoney(int storePayMoney) {
		this.storePayMoney = storePayMoney;
	}

	public int getMileageIdx() {
		return mileageIdx;
	}

	public void setMileageIdx(int mileageIdx) {
		this.mileageIdx = mileageIdx;
	}

	public int getMileagePrice() {
		return mileagePrice;
	}

	public void setMileagePrice(int mileagePrice) {
		this.mileagePrice = mileagePrice;
	}

	public String getMileageReason() {
		return mileageReason;
	}

	public void setMileageReason(String mileageReason) {
		this.mileageReason = mileageReason;
	}

	public int getMemberIdx() {
		return memberIdx;
	}

	public void setMemberIdx(int memberIdx) {
		this.memberIdx = memberIdx;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getsPayCount() {
		return sPayCount;
	}

	public void setsPayCount(String sPayCount) {
		this.sPayCount = sPayCount;
	}

	public String getsPayMoney() {
		return sPayMoney;
	}

	public void setsPayMoney(String sPayMoney) {
		this.sPayMoney = sPayMoney;
	}

	public String getMilPrice() {
		return milPrice;
	}

	public void setMilPrice(String milPrice) {
		this.milPrice = milPrice;
	}

	public String getmIdx() {
		return mIdx;
	}

	public void setmIdx(String mIdx) {
		this.mIdx = mIdx;
	}

	public int getPayMoney() {
		return payMoney;
	}

	public void setPayMoney(int payMoney) {
		this.payMoney = payMoney;
	}

	

}
