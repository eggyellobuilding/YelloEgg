package egg.mypage.model;

import java.util.List;
import egg.mypage.model.MypageDTO;

public interface MypageDAO {

	/**1:1문의글 작성*/
	public int mypageQaboardWrite(MypageDTO mpdto);
	
	/**회원 문의게시판 총게시글수 */
	public int qaboardTotalCnt(int qaMemberIdx);
	
	/**관리자페이지에서 문의게시판 총게시글 수*/
	public int adminQaboardTotalCnt();
	
	/**문의 게시판 목록*/
	public List<MypageDTO> mypageQaboardList(int ls, int cp, int memberIdx);
	
	/**관리자페이지 - 문의 게시판 목록*/
	public List<MypageDTO> adminQaboardList(int ls, int cp);
	
	/**관리자페이지 - 문의글 답변쓰기*/
	public int adminQaboardAnswer(MypageDTO mpdto);
	
	/**관리자페이지 - 답변글 완료후 답변상태 update */
	public int updateQaAnswer(int qaIdx);
	
	/**관리자 페이지 - 답변대기 글 수*/
	public int countAnswerWait();
	
	/**스토어 구매 내역*/
	public List<MypageDTO> mypageStoreBuyList(int ls, int cp, int memberIdx);
	
	/**스토어 totalCnt*/
	public int storeBuyTotalCnt(int storePayMemberIdx);
	
	/**관리자 페이지 스토어 totalCnt*/
	public int adminStoreBuyTotalCnt();
	
	/**스토어 구매 취소시, 상태업데이트*/
	public int mypageUdpateStoreState(int storePayIdx);
	
	/**스토어 구매 취소*/
	public int mypageCancelStoreBuy(int delPaymentStorePayIdx);
	
	/**스토어 구매 취소시, idx로 사용 마일리지 가져오기*/
	public int getUseStoreMileage(int storePayIdx);
	
	/**스토어 구매취소시, 사용한 마일리지 반환*/
	public int refundStoreMileage(MypageDTO mpdto);
	
	/**스토어 취소 내역*/
	public List<MypageDTO> mypageStoreCancelList(int ls,int cp, int memberIdx);
	
	/**스토어 결제취소 totalCnt*/
	public int storeCancelTotalCnt(int storePayMemberIdx);
	
	/**관리자 스토어 결제취소 totalCnt*/
	public int adminStoreCancelTotalCnt();
	
	/**관리자 페이지 - 스토어 구매 내역*/
	public List<MypageDTO> adminStoreBuyList(int ls, int cp);
	
	/**관리자 페이지 - 스토어 취소 내역*/
	public List<MypageDTO> adminStoreCancelList(int ls, int cp);
	
	/**예약 확인 내역*/
	public List<MypageDTO> mypageReservationList(int ls, int cp, int memberIdx);
	
	/**예약 페이지 TotalCnt*/
	public int reservationTotalCnt(int reservationMemberIdx);
	
	/**영화 예매 취소시, 상태업데이트*/
	public int mypageUdpateReservationState(int reservationIdx);
	
	/**영화 예매 취소*/
	public int mypageCancelReservation(int delReservationIdx);
	
	/**영화예매 취소시, idx로 사용 마일리지 가져오기*/
	public int getUseReservationMileage(int reservationIdx);
	
	/**영화예 매취소시, 사용한 마일리지 반환*/
	public int refundReservationMileage(MypageDTO mpdto);
	
	/**영화 취소 내역*/
	public List<MypageDTO> mypageReservationCancelList(int ls,int cp, int memberIdx);
	
	/**영화 취소 내역 TotalCnt*/
	public int reservationCancelTotalCnt(int reservationMemberIdx);
	
	/**관리자 페이지 - 영화 예매 TotalCnt*/
	public int adminReservationConfirmTotalCnt();
	
	/**관리자 페이지 - 영화 취소 TotalCnt*/
	public int adminReservationCancelTotalCnt();
	
	/**관리자 페이지 - 영화 예매 내역*/
	public List<MypageDTO> adminReservationConfirmList(int ls, int cp);
	
	/**관리자 페이지 - 영화 예매 취소 내역*/
	public List<MypageDTO> adminReservationCancelList(int ls, int cp);
}
