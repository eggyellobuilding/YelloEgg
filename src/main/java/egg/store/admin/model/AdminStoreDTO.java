package egg.store.admin.model;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class AdminStoreDTO {

	private int storeIdx;
	private String storeName;
	private String storeImg;
	private int storeCount;
	private String storeCtg;
	private int storePrice;
	private java.sql.Date storeDate;
	private String storeState;
	private String storeInfo;
	private MultipartFile storeTitleImg;
	
	private String storename;
	private String storeimg;
	private String storecount;
	private String storectg;
	private String storeprice;
	private String storedate;
	private String storestate;
	private String storeinfo;
	private String storetitleimg;
	
	public AdminStoreDTO() {
		super();
	}
	public AdminStoreDTO(int storeIdx, String storeName, String storeImg, int storeCount, String storeCtg,
			int storePrice, Date storeDate, String storeState,String storeInfo,MultipartFile storeTitleImg) {
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
	public java.sql.Date getStoreDate() {
		return storeDate;
	}
	public void setStoreDate(java.sql.Date storeDate) {
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
	public MultipartFile getStoreTitleImg() {
		return storeTitleImg;
	}
	public void setStoreTitleImg(MultipartFile storeTitleImg) {
		this.storeTitleImg = storeTitleImg;
	}
	public String getStorename() {
		return storename;
	}
	public void setStorename(String storename) {
		this.storename = storename;
	}
	public String getStoreimg() {
		return storeimg;
	}
	public void setStoreimg(String storeimg) {
		this.storeimg = storeimg;
	}
	public String getStorecount() {
		return storecount;
	}
	public void setStorecount(String storecount) {
		this.storecount = storecount;
	}
	public String getStorectg() {
		return storectg;
	}
	public void setStorectg(String storectg) {
		this.storectg = storectg;
	}
	public String getStoreprice() {
		return storeprice;
	}
	public void setStoreprice(String storeprice) {
		this.storeprice = storeprice;
	}
	public String getStoredate() {
		return storedate;
	}
	public void setStoredate(String storedate) {
		this.storedate = storedate;
	}
	public String getStorestate() {
		return storestate;
	}
	public void setStorestate(String storestate) {
		this.storestate = storestate;
	}
	public String getStoreinfo() {
		return storeinfo;
	}
	public void setStoreinfo(String storeinfo) {
		this.storeinfo = storeinfo;
	}
	public String getStoretitleimg() {
		return storetitleimg;
	}
	public void setStoretitleimg(String storetitleimg) {
		this.storetitleimg = storetitleimg;
	}
	
}
