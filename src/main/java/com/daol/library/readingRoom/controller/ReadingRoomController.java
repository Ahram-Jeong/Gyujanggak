package com.daol.library.readingRoom.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.google.gson.Gson;
import com.daol.library.readingRoom.domain.ReadingRoom;
import com.daol.library.readingRoom.service.ReadingRoomService;

@Controller
public class ReadingRoomController {

	@Autowired
	private ReadingRoomService service;

	// 열람실 메인 화면
	@RequestMapping(value = "readingRoom.do", method = RequestMethod.GET)
	public String readingRoomView() {
		return "readingRoom/readingRoomMain";
	}

	// 좌석 현황
	@ResponseBody
	@RequestMapping(value = "printAllReadingRoom.do", method = RequestMethod.POST)
	public String printAllReadingRoom() {
		Date nowDate = new Date();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yy/MM/dd");
		String strNowDate = simpleDateFormat.format(nowDate);

		System.out.println("오늘 날짜 : " + strNowDate);

		List<ReadingRoom> result = service.printAllReadingRoom(strNowDate);
		
		Gson gson = new Gson();
		String rsvList = gson.toJson(result);
		System.out.println(rsvList); // 예약 목록
		return rsvList;
	}
	
	// 좌석 예약
	@ResponseBody
	@RequestMapping(value = "reservationReadingRoom.do", method = RequestMethod.POST)
	public String reservationReadingRoom(@ModelAttribute ReadingRoom readingRoom, Model model) {
		int result = service.reservationReadingRoom(readingRoom);
		if (result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}

}
