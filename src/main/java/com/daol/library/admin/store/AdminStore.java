package com.daol.library.admin.store;

import java.util.List;

import com.daol.library.admin.domain.PageInfo;
import com.daol.library.book.domain.Book;

import com.daol.library.member.domain.Member;
import com.daol.library.mypage.domain.Qna;

public interface AdminStore {
	public int selectListCount();

	public List<Book> selectAll(PageInfo pi);
	//유저타입 끌어오기
	public Member selectMemberCk(String login);
	//관리자페이지 문의리스트 출력
	public List<Qna> selectAllQna(PageInfo pi);
	//페이징처리용
	public int selectQnaListCount();
}