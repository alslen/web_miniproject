package com.example.camping.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.camping.model.Booking;
import com.example.camping.repository.BookingRepository;

@Service
public class BookingService {

	@Autowired
	private BookingRepository bookingRepository;
	
//	@Transactional
//	public  List<Booking> findById(Long num) {
//		 @SuppressWarnings("unchecked")
//		List<Booking> booking = (List<Booking>) bookingRepository.findById(num).get();
//		return booking;
//	}
	
	// 예약
	public void insert(Booking booking) {
		SimpleDateFormat sdfYMD = new SimpleDateFormat("yyyy-MM-dd");
		try {
			Date check_in = sdfYMD.parse(booking.getCheck_in());
			Date check_out = sdfYMD.parse(booking.getCheck_out());
			
			long diff = check_out.getTime() - check_in.getTime();
			
			TimeUnit time = TimeUnit.DAYS; 
		    long diffrence = time.convert(diff, TimeUnit.MILLISECONDS);
		    System.out.println("The difference in days is : "+diffrence);
		    booking.setDayCnt(diffrence);
			
		} catch (ParseException e) {
			e.printStackTrace();
		} 
		bookingRepository.save(booking);	
	}
	
	
	// 예약 목록
	public List<Booking> list(Long member_id){
		return bookingRepository.findByMember(member_id);
	}
	
	// 예약 목록 개수
	public int count(Long member_id) {
		return bookingRepository.findByCount(member_id);
	}
	
	// 예약 목록(관리자)
	public List<Booking> alist(){
		return bookingRepository.findAll();
	}
	
	// 예약 목록 개수(관리자)
	public Long acount() {
		return bookingRepository.count();
	}
	
	// 예약 승인상태로 변경
	@Transactional
	public void update(Booking booking) {
		Booking b = bookingRepository.findById(booking.getBookNum()).get();
		b.setStatus(1l);
	}
	
	// 예약 취소상태로 변경
	@Transactional
	public void cancle(Booking booking) {
		Booking b = bookingRepository.findById(booking.getBookNum()).get();
		b.setStatus(2l);
	}
	
	// 예약 취소를 누르면 오늘 날짜 이전에 체크아웃한건 다 삭제
	public void cancleCheck(Booking booking) {
		if(booking.getStatus()==2) {
			SimpleDateFormat sdfYMD = new SimpleDateFormat("yyyy-MM-dd");
			try {
				Date check_in = sdfYMD.parse(booking.getCheck_in());
				Date check_out = sdfYMD.parse(booking.getCheck_out());
				
				bookingRepository.cancleCheck(check_in, check_out);
			} catch (ParseException e) {
				
				e.printStackTrace();
			}
		}
	
	
	}
}
