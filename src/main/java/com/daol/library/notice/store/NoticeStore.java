package com.daol.library.notice.store;

import java.util.List;

import com.daol.library.notice.domain.Notice;
import com.daol.library.notice.domain.PageInfo;

public interface NoticeStore {

	public List<Notice> selectAll(PageInfo pi);

	public int insertNotice(Notice notice);

	public int selectListCount();

}
