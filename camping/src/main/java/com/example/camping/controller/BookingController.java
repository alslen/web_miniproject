package com.example.camping.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.camping.model.Booking;
import com.example.camping.service.BookingService;
import com.example.camping.service.CampingService;

@Controller
@RequestMapping("/booking/*")
public class BookingController {
	
	@Autowired
	private CampingService campService;
	
	@Autowired BookingService bookService;
	
	// 예약하기 폼
	@GetMapping("book/{camp_id}")
	public String book(@PathVariable Long camp_id, Model model) {
		model.addAttribute("bookList",campService.detail(camp_id));
		return "/booking/bookingForm";
	}
	
	// 예약(DB에 insert)
	@PostMapping("reserve")
	public String reserve(Booking booking) {
		bookService.insert(booking);
		return "redirect:/list";
	}
	// 로그인한 회원이 보는 목록
	@GetMapping("bookList/{member_id}")
	public String bookList(@PathVariable Long member_id, Model model) {
		model.addAttribute("blists", bookService.list(member_id));
		model.addAttribute("bcount", bookService.count(member_id));
		return "/booking/reservationInfo";
	}
	
	// 관리자 목록(예약)
	@GetMapping("adminList")
	public String adminList(Model model) {
		model.addAttribute("alists", bookService.alist());
		model.addAttribute("acount", bookService.acount());
		return "/booking/adminList";
	}
	
	// 예약승인상태로 변경
	@PutMapping("statusUpdate/{bookNum}")
	@ResponseBody
	public String statusUpdate(@PathVariable Long bookNum, Booking booking) {
		bookService.update(booking);
		//bookService.cancleCheck(booking);
		return "success";
	}
	
	// 예약취소상태로 변경
	@PutMapping("statusCancle/{bookNum}")
	@ResponseBody
	public String statusCancle(@PathVariable Long bookNum, Booking booking) {
		bookService.cancle(booking);
		//bookService.cancleCheck(booking);
		return "success";
	}
}
