package com.example.camping.controller;

import java.util.HashMap;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.camping.config.auth.PrincipalMember;
import com.example.camping.model.Camping;
import com.example.camping.model.Review;
import com.example.camping.service.ReviewService;

@Controller
@RequestMapping("/review/*")
public class ReviewController {

	
	@Autowired
	private ReviewService reviewService;
	
	// 댓글 추가
	@PostMapping("insert/{camp}")
	@ResponseBody
	public String reviewInsert(@PathVariable Long camp, @RequestBody Review review,
			@AuthenticationPrincipal PrincipalMember principal) {
		// camp_id를 셋팅해줌
		Camping c = new Camping();
		c.setCamp_id(camp);
		review.setCamping(c);
		
		review.setMember(principal.getMember());
		
		reviewService.insert(review);
		return "success";
	}
	
	// 댓글 전체보기
	@GetMapping("list/{camp_id}")
	@ResponseBody
	public HashMap<String, Object> list(@PathVariable Long camp_id, Model model){

		HashMap<String, Object> hm = new HashMap<String, Object>();
		List<Review> rlist = reviewService.list(camp_id);
		int count = reviewService.count(camp_id);
		hm.put("rlist", rlist);
		hm.put("count", count);
		
		return hm;
	}
	
	// 댓글 삭제
	@DeleteMapping("delete/{reviewNum}")
	@ResponseBody
	public String delete(@PathVariable Long reviewNum) {
		reviewService.delete(reviewNum);
		return "success";
	}
	
	// 댓글 상세보기
	@GetMapping("update/{reviewNum}")
	public String update(@PathVariable Long reviewNum, Model model) {
		model.addAttribute("review", reviewService.detail(reviewNum));
		return "/camping/campDetail";
	}
	
	// 댓글 수정
	@PutMapping("update/{reviewNum}")
	@ResponseBody
	public String update(@PathVariable Long reviewNum, Review review) {
		reviewService.update(review);
		return "success";
	}
	
	// 내가 쓴 리뷰 보기
	@GetMapping("myList/{id}")
	public String myList(@PathVariable Long id, Model model) {
		model.addAttribute("mreview",reviewService.myList(id));
		model.addAttribute("mcount", reviewService.myCount(id));
		return "/review/myList";
	}
	
}
