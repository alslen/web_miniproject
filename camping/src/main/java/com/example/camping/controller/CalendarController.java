package com.example.camping.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.camping.model.Booking;
import com.example.camping.model.Camping;
import com.example.camping.service.BookingService;
import com.example.camping.service.CampingService;
import com.example.camping.service.MemberService;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
@RequestMapping("/full-calendar")
public class CalendarController {
	@Autowired
	private BookingService bookingService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private CampingService campingService;
	
	//달력 리스트폼 
	  @GetMapping("/calendar/{camp_id}")

	  public String month(@PathVariable Long camp_id) {
		  return"/board/calendar"; 
	  }
	//달력 리스트
	  @GetMapping("/camp_calendar/{camp_id}")
	  @ResponseBody
	  public List<Booking> campmonth(@PathVariable Long camp_id, Model model) {
		  Camping camping = campingService.findById(camp_id);
		  List<Booking> listAll = camping.getBooking();
		  JSONObject jsonObj = new JSONObject();
	      JSONArray jsonArr = new JSONArray();
	      
	      HashMap<String, Object> hash = new HashMap<>();
	      
	      for (int i = 0; i < listAll.size(); i++) {
	            hash.put("start", listAll.get(i).getCheck_in());
	            hash.put("end", listAll.get(i).getCheck_out());
	 
	            jsonObj = new JSONObject(hash);
	            jsonArr.add(jsonObj);
	        }
		
		  return jsonArr;
	  }
}
