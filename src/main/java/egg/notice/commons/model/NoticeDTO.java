package egg.notice.commons.model;

import java.sql.Date;

public class NoticeDTO {
	private int noticeIdx, noticeReadnum, noticeCinemaIdx, cinemaIdx;
	private Date noticeWriteDate;
	private String noticeTitle, noticeContent, noticeTop, cinemaName;
	public NoticeDTO() {
	}
	public NoticeDTO(int noticeIdx, int noticeReadnum, int noticeCinemaIdx, int cinemaIdx, Date noticeWriteDate,
			String noticeTitle, String noticeContent, String noticeTop, String cinemaName) {
		super();
		this.noticeIdx = noticeIdx;
		this.noticeReadnum = noticeReadnum;
		this.noticeCinemaIdx = noticeCinemaIdx;
		this.cinemaIdx = cinemaIdx;
		this.noticeWriteDate = noticeWriteDate;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeTop = noticeTop;
		this.cinemaName = cinemaName;
		System.out.println(noticeWriteDate);
	}
	public int getNoticeIdx() {
		return noticeIdx;
	}
	public void setNoticeIdx(int noticeIdx) {
		this.noticeIdx = noticeIdx;
	}
	public int getNoticeReadnum() {
		return noticeReadnum;
	}
	public void setNoticeReadnum(int noticeReadnum) {
		this.noticeReadnum = noticeReadnum;
	}
	public int getNoticeCinemaIdx() {
		return noticeCinemaIdx;
	}
	public void setNoticeCinemaIdx(int noticeCinemaIdx) {
		this.noticeCinemaIdx = noticeCinemaIdx;
	}
	public Date getNoticeWriteDate() {
		return noticeWriteDate;
	}
	public void setNoticeWriteDate(Date noticeWriteDate) {
		this.noticeWriteDate = noticeWriteDate;
		//System.out.println(noticeWriteDate + "========================");
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public String getNoticeContent() {
		return noticeContent;
	}
	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}
	public String getNoticeTop() {
		return noticeTop;
	}
	public void setNoticeTop(String noticeTop) {
		this.noticeTop = noticeTop;
	}
	public String getCinemaName() {
		return cinemaName;
	}
	public void setCinemaName(String cinemaName) {
		this.cinemaName = cinemaName;
	}
	public int getCinemaIdx() {
		return cinemaIdx;
	}
	public void setCinemaIdx(int cinemaIdx) {
		this.cinemaIdx = cinemaIdx;
	}
}

