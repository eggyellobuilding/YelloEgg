package egg.mypage.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import egg.mypage.model.MypageDTO;

public class MypageDAOImple implements MypageDAO {

private SqlSessionTemplate sqlMap;

	public MypageDAOImple(SqlSessionTemplate sqlMap) {
	super();
	this.sqlMap = sqlMap;
}

	/**1:1문의글 작성*/
	public int mypageQaboardWrite(MypageDTO mpdto) {
		int count = sqlMap.insert("mypageQaboardWrite", mpdto);
		return count;
	}
	
	/**문의 게시판 총게시글수 */
	public int qaboardTotalCnt(int qaMemberIdx) {
		int result =sqlMap.selectOne("qaboardTotalCnt", qaMemberIdx);
		return result;
	}
	/**관리자 페이지 - 문의 게시판 총게시글 수*/
	public int adminQaboardTotalCnt() {
		int result =sqlMap.selectOne("adminQaboardTotalCnt");
		return result;
		}

	/**문의 게시판 목록*/
	public List<MypageDTO> mypageQaboardList(int ls, int cp, int memberIdx) {
		Map data=new HashMap();
		int startnum=(cp-1)*ls+1;
		int endnum=cp*ls;
		data.put("startnum", startnum);
		data.put("endnum", endnum);
		data.put("memberIdx", memberIdx);
		List<MypageDTO> lists=sqlMap.selectList("mypageQaboardList", data);
		return lists;
	}
	
	/**관리자 페이지- 문의 게시판 목록*/
	public List<MypageDTO> adminQaboardList(int ls, int cp) {
		Map data=new HashMap();
		int startnum=(cp-1)*ls+1;
		int endnum=cp*ls;
		data.put("startnum", startnum);
		data.put("endnum", endnum);
		List<MypageDTO> lists=sqlMap.selectList("adminQaboardList", data);
		return lists;
	}
	
	/**관리자 페이지 - 문의글 답변 쓰기*/
	public int adminQaboardAnswer(MypageDTO mpdto) {
		int count = sqlMap.insert("adminQaboardAnswer", mpdto);
		return count;
	}
	
	/**관리자 페이지 - 답변글 완료후 답변상태 update*/
	public int updateQaAnswer(int qaIdx) {
		int count = sqlMap.update("updateQaAnswer", qaIdx);
		return count;
	}
	
	/**답변대기 글 수*/
	public int countAnswerWait() {
		int count = sqlMap.selectOne("countAnswerWait");
		return count;
	}
	
	/**스토어 구매 내역*/
	public List<MypageDTO> mypageStoreBuyList(int ls, int cp, int memberIdx) {
		Map data=new HashMap();
		int startnum=(cp-1)*ls+1;
		int endnum=cp*ls;
		data.put("startnum", startnum);
		data.put("endnum", endnum);
		data.put("memberIdx", memberIdx);
		List<MypageDTO> lists=sqlMap.selectList("mypageStoreBuyList", data);
		return lists;
	}
	
	/**스토어구매 TotalCnt*/
	public int storeBuyTotalCnt(int storePayMemberIdx) {
		int count = sqlMap.selectOne("storeBuyTotalCnt",storePayMemberIdx);
		return count;
	}
	
	/**관리자 스토어구매 TotalCnt*/
	public int adminStoreBuyTotalCnt() {
		int count = sqlMap.selectOne("adminStoreBuyTotalCnt");
		return count;
		}
	
	/**스토어 구매취소시, 상태 업데이트*/
	public int mypageUdpateStoreState(int storePayIdx) {
		int count =sqlMap.update("mypageUpdateStoreState", storePayIdx);
		return count;
	}
	
	/**스토어 구매취소*/
	public int mypageCancelStoreBuy(int delPaymentStorePayIdx) {
		int count=sqlMap.insert("mypageCancelStoreBuy", delPaymentStorePayIdx);
		return count;
	}
	
	/**스토어 구매 취소시, idx로 사용 마일리지 가져오기*/
	public int getUseStoreMileage(int storePayIdx) {
		int count = sqlMap.selectOne("getUseStoreMileage", storePayIdx);
		return count;
	}
	
	/**스토어 구매 취소시, 사용했던 마일리지 반환*/
	public int refundStoreMileage(MypageDTO mpdto) {
		int count = sqlMap.insert("refundStoreMileage", mpdto);
		return count;
	}
	
	/**스토어 구매취소 내역*/
	public List<MypageDTO> mypageStoreCancelList(int ls, int cp, int memberIdx) {
		Map data=new HashMap();
		int startnum=(cp-1)*ls+1;
		int endnum=cp*ls;
		data.put("startnum", startnum);
		data.put("endnum", endnum);
		data.put("memberIdx", memberIdx);
		List<MypageDTO> lists=sqlMap.selectList("mypageStoreCancelList", data);
		return lists;
	}
	
	/**관리자 페이지 스토어 삭제 TotalCnt*/
	public int adminStoreCancelTotalCnt() {
		int count =sqlMap.selectOne("adminStoreCancelTotalCnt");
		return count;
	}
	
	/**스토어 삭제 TotalCnt*/
	public int storeCancelTotalCnt(int storePayMemberIdx) {
		int count =sqlMap.selectOne("storeCancelTotalCnt",storePayMemberIdx);
		return count;
	}
	
	/**관리자 페이지 - 스토어 구매 내역*/
	public List<MypageDTO> adminStoreBuyList(int ls, int cp) {
		Map data=new HashMap();
		int startnum=(cp-1)*ls+1;
		int endnum=cp*ls;
		data.put("startnum", startnum);
		data.put("endnum", endnum);
		List<MypageDTO> lists=sqlMap.selectList("adminStoreBuyList", data);
		return lists;
	}
	/**관리자 페이지 - 스토어 취소 내역*/
	public List<MypageDTO> adminStoreCancelList(int ls, int cp) {
		Map data=new HashMap();
		int startnum=(cp-1)*ls+1;
		int endnum=cp*ls;
		data.put("startnum", startnum);
		data.put("endnum", endnum);
		List<MypageDTO> lists=sqlMap.selectList("adminStoreCancelList", data);
		return lists;
		}
	
	/**예약내역*/
	public List<MypageDTO> mypageReservationList(int ls, int cp, int memberIdx) {
		Map data=new HashMap();
		int startnum=(cp-1)*ls+1;
		int endnum=cp*ls;
		data.put("startnum", startnum);
		data.put("endnum", endnum);
		data.put("memberIdx", memberIdx);
		List<MypageDTO> lists=sqlMap.selectList("mypageReservationList", data);
		return lists;
		}
	
	/**예약 내역 TotalCnt*/
	public int reservationTotalCnt(int reservationMemberIdx) {
		int count =sqlMap.selectOne("reservationTotalCnt",reservationMemberIdx);
		return count;
	}
	
	/**영화예매취소시, 상태 업데이트*/
	public int mypageUdpateReservationState(int reservationIdx) {
		int count =sqlMap.update("mypageUpdateReservationState", reservationIdx);
		return count;
		}
	
	/**영화 예매 취소시, idx로 사용 마일리지 가져오기*/
	public int getUseReservationMileage(int reservationIdx) {
		int count = sqlMap.selectOne("getUseReservationMileage", reservationIdx);
		return count;
	}
	
	/**스토어 구매 취소시, 사용했던 마일리지 반환*/
	public int refundReservationMileage(MypageDTO mpdto) {
		int count = sqlMap.insert("refundReservationMileage", mpdto);
		return count;
	}
	
	/**영화 예매 취소*/
	public int mypageCancelReservation(int delReservationIdx) {
		int count=sqlMap.insert("mypageCancelReservation", delReservationIdx);
		return count;
		}
	
	/**영화 예매취소 내역*/
	public List<MypageDTO> mypageReservationCancelList(int ls, int cp, int memberIdx) {
		Map data=new HashMap();
		int startnum=(cp-1)*ls+1;
		int endnum=cp*ls;
		data.put("startnum", startnum);
		data.put("endnum", endnum);
		data.put("memberIdx", memberIdx);
		List<MypageDTO> lists=sqlMap.selectList("mypageReservationCancelList", data);
		return lists;
		}
	
	/**영화 취소 내역 TotalCnt*/
	public int reservationCancelTotalCnt(int reservationMemberIdx) {
		int count = sqlMap.selectOne("reservationCancelTotalCnt", reservationMemberIdx);
		return count;
	}
	
	/**관리자 페이지 - 영화 예매 TotalCnt*/
	public int adminReservationConfirmTotalCnt() {
		int count = sqlMap.selectOne("adminReservationConfirmTotalCnt");
		return count;
	}
	
	/**관리자 페이지 - 영화 취소 TotalCnt*/
	public int adminReservationCancelTotalCnt() {
		int count = sqlMap.selectOne("adminReservationCancelTotalCnt");
		return count;
	}
	
	/**관리자 페이지 - 영화 예매 내역*/
	public List<MypageDTO> adminReservationConfirmList(int ls, int cp) {
		Map data=new HashMap();
		int startnum=(cp-1)*ls+1;
		int endnum=cp*ls;
		data.put("startnum", startnum);
		data.put("endnum", endnum);
		List<MypageDTO> lists=sqlMap.selectList("adminReservationConfirmList", data);
		return lists;
	}
	
	/**관리자 페이지 - 영화 예매 취소 내역*/
	public List<MypageDTO> adminReservationCancelList(int ls, int cp) {
		Map data=new HashMap();
		int startnum=(cp-1)*ls+1;
		int endnum=cp*ls;
		data.put("startnum", startnum);
		data.put("endnum", endnum);
		List<MypageDTO> lists=sqlMap.selectList("adminReservationCancelList", data);
		return lists;
	}
}
