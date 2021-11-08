package com.daol.library.mypage.service;

import java.util.List;

import com.daol.library.book.domain.Book;
import com.daol.library.book.domain.Review;
import com.daol.library.member.domain.Member;
import com.daol.library.mypage.domain.PageInfo;
import com.daol.library.readingRoom.domain.ReadingRoom;
import com.daol.library.studyRoom.domain.StudyRoom;

public interface MypageService {

	//회원정보 관리
	public Member printOneInfo(Member member);
	
	public int payment(String userId);
	
	public int modifyMember(Member member);
	
	public int removeMember(String userId);
	
	
	//도서
	/** 대출 도서 전체 권수 */
	public int getListCount();
	/** 대출 내역 */
	public List<Book> printAllHistory(PageInfo pi);
	/** 서평 조회 */
	public int printOneReview(Review review);
	/** 서평 등록 */
	public int registerReview(Review review);
	/** 서평 수정 */
	public int modifyReview(Review review);
	/** 서평 삭제 */
	public int removeReview(Review review);
	/** 예약 내역 */
	public Book printBookingHistory(Book book);
	/** 예약 취소 */
	public int cancelBooking(int bookNo);
	/** 희망 도서 내역 */
	public Book printWishBook(Book book);
	
	//희망도서 신청 이메일?
	
	public Book printLikeList(Book book);
	
	//취향 분석
	
	
	//시설 이용
	public ReadingRoom printAll(ReadingRoom readingRoom);
	
	public StudyRoom printAll(StudyRoom studryRoom);
	/** 내역 삭제 */
	public int removeReadingRoomHistory(int rReservationNo);
	/** 내역 삭제 */
	public int removeStudyRoomHistory(int sReservationNo);
	/** 예약 취소 */
	public int cancelReadingRoom(int rReservationNo);
	/** 예약 취소 */
	public int cancelStudyRoom(int sReservationNo);
	
	
}