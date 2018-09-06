package egg.moviePayment.model;

public class MoviePaymentDTO {
	
	private String CST_MID;
	private String CST_PLATFORM;
	private String LGD_BUYEREMAIL;
	private String LGD_OID;
	private String LGD_TIMESTAMP;
	private String LGD_WINDOW_TYPE;
	private String LGD_CUSTOM_SWITCHINGTYPE;
	private String LGD_BUYER; 
	private String LGD_PRODUCTINFO;
	private String LGD_AMOUNT;
	private String LGD_CUSTOM_USABLEPAY;
	private String LGD_MERTKEY;
	 
	public MoviePaymentDTO() {
		super();
	}

	public MoviePaymentDTO(String cST_MID, String cST_PLATFORM, String lGD_BUYEREMAIL, String lGD_OID, String lGD_TIMESTAMP,
			String lGD_WINDOW_TYPE, String lGD_CUSTOM_SWITCHINGTYPE, String lGD_BUYER, String lGD_PRODUCTINFO,
			String lGD_AMOUNT, String lGD_CUSTOM_USABLEPAY, String lGD_MERTKEY) {
		super();
		CST_MID = cST_MID;
		CST_PLATFORM = cST_PLATFORM;
		LGD_BUYEREMAIL = lGD_BUYEREMAIL;
		LGD_OID = lGD_OID;
		LGD_TIMESTAMP = lGD_TIMESTAMP;
		LGD_WINDOW_TYPE = lGD_WINDOW_TYPE;
		LGD_CUSTOM_SWITCHINGTYPE = lGD_CUSTOM_SWITCHINGTYPE;
		LGD_BUYER = lGD_BUYER;
		LGD_PRODUCTINFO = lGD_PRODUCTINFO;
		LGD_AMOUNT = lGD_AMOUNT;
		LGD_CUSTOM_USABLEPAY = lGD_CUSTOM_USABLEPAY;
		LGD_MERTKEY = lGD_MERTKEY;
	}

	public String getCST_MID() {
		return CST_MID;
	}

	public void setCST_MID(String cST_MID) {
		CST_MID = cST_MID;
	}

	public String getCST_PLATFORM() {
		return CST_PLATFORM;
	}

	public void setCST_PLATFORM(String cST_PLATFORM) {
		CST_PLATFORM = cST_PLATFORM;
	}

	public String getLGD_BUYEREMAIL() {
		return LGD_BUYEREMAIL;
	}

	public void setLGD_BUYEREMAIL(String lGD_BUYEREMAIL) {
		LGD_BUYEREMAIL = lGD_BUYEREMAIL;
	}

	public String getLGD_OID() {
		return LGD_OID;
	}

	public void setLGD_OID(String lGD_OID) {
		LGD_OID = lGD_OID;
	}

	public String getLGD_TIMESTAMP() {
		return LGD_TIMESTAMP;
	}

	public void setLGD_TIMESTAMP(String lGD_TIMESTAMP) {
		LGD_TIMESTAMP = lGD_TIMESTAMP;
	}

	public String getLGD_WINDOW_TYPE() {
		return LGD_WINDOW_TYPE;
	}

	public void setLGD_WINDOW_TYPE(String lGD_WINDOW_TYPE) {
		LGD_WINDOW_TYPE = lGD_WINDOW_TYPE;
	}

	public String getLGD_CUSTOM_SWITCHINGTYPE() {
		return LGD_CUSTOM_SWITCHINGTYPE;
	}

	public void setLGD_CUSTOM_SWITCHINGTYPE(String lGD_CUSTOM_SWITCHINGTYPE) {
		LGD_CUSTOM_SWITCHINGTYPE = lGD_CUSTOM_SWITCHINGTYPE;
	}

	public String getLGD_BUYER() {
		return LGD_BUYER;
	}

	public void setLGD_BUYER(String lGD_BUYER) {
		LGD_BUYER = lGD_BUYER;
	}

	public String getLGD_PRODUCTINFO() {
		return LGD_PRODUCTINFO;
	}

	public void setLGD_PRODUCTINFO(String lGD_PRODUCTINFO) {
		LGD_PRODUCTINFO = lGD_PRODUCTINFO;
	}

	public String getLGD_AMOUNT() {
		return LGD_AMOUNT;
	}

	public void setLGD_AMOUNT(String lGD_AMOUNT) {
		LGD_AMOUNT = lGD_AMOUNT;
	}

	public String getLGD_CUSTOM_USABLEPAY() {
		return LGD_CUSTOM_USABLEPAY;
	}

	public void setLGD_CUSTOM_USABLEPAY(String lGD_CUSTOM_USABLEPAY) {
		LGD_CUSTOM_USABLEPAY = lGD_CUSTOM_USABLEPAY;
	}

	public String getLGD_MERTKEY() {
		return LGD_MERTKEY;
	}

	public void setLGD_MERTKEY(String lGD_MERTKEY) {
		LGD_MERTKEY = lGD_MERTKEY;
	}

	 
}
