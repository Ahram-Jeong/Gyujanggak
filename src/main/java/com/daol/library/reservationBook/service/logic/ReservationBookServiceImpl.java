package com.daol.library.reservationBook.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daol.library.reservationBook.domain.ReservationBook;
import com.daol.library.reservationBook.service.ReservationBookService;
import com.daol.library.reservationBook.store.ReservationBookStore;

@Service
public class ReservationBookServiceImpl implements ReservationBookService {
	@Autowired
	private ReservationBookStore store;

	@Override
	public List<ReservationBook> printAllRsvBook(String userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int registerRsv(ReservationBook reservationBook) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int removeRsv(ReservationBook reservationBook) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int modifyRsv(ReservationBook reservationBook) {
		// TODO Auto-generated method stub
		return 0;
	}

}
