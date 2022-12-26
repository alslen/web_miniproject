package com.example.camping.controller;

import javax.servlet.http.HttpSession;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.camping.config.auth.PrincipalMember;
import com.example.camping.model.Member;
import com.example.camping.repository.MemberRepository;
import com.example.camping.service.MemberService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class HomeController {
	private final MemberService memberService;
	private final MemberRepository memberRepository;
	private final BCryptPasswordEncoder encoder;
	
	//메인화면
	//@GetMapping("/")
	//public String home() {
	//	return "/board/index";
	//}
	@GetMapping("/login")
	public String login() {
		return "/user/login";
	}
	@GetMapping("/join")
	public String join() {
		return "/user/join";
	}
	//회원수정폼
	@GetMapping("/update/{id}")
	public String update(@PathVariable Long id, Model model) {
		model.addAttribute("mlist", memberService.findById(id));
		model.addAttribute("myear", memberRepository.findByIdBirthYear(id));
		model.addAttribute("mmonth", memberRepository.findByIdBirthMonth(id));
		model.addAttribute("mday", memberRepository.findByIdBirthDay(id));
		return "/user/update";
	}
	//회원정보수정
	@PutMapping("update")
	@ResponseBody
	public String update(HttpSession session, @AuthenticationPrincipal PrincipalMember principal, @RequestBody Member member) {
		String rawPassword = member.getPassword();
		if(encoder.matches(rawPassword, principal.getMember().getPassword())) {
			memberService.update(member);
			session.invalidate();
			return "success";
		}
		return "fail";
	}
	@GetMapping("/booking")
	public String booking() {
		return "/booking/bookingForm";
	}
	
	// 아이디 중복 확인
	@GetMapping("idCheck")
	public String idCheck() {
		return "/user/idCheck";
	}
	
	@PostMapping("idCheckPro")
	@ResponseBody
	public String idCheck(@RequestBody Member member) {
		if(memberRepository.findByusername(member.getUsername())!=null) {
			return "fail";
		}
		return "success";
	}
	
	//회원가입
	@PutMapping("register")
	@ResponseBody
	public String register(HttpSession session, @RequestBody Member member) {
		
		if(memberRepository.findByusername(member.getUsername())!=null) {
			return "fail";
		}
		memberService.register(member);
		return "success";
	}
	
	@DeleteMapping("delete/{id}")
	@ResponseBody
	public String delete(@PathVariable Long id, HttpSession session, @AuthenticationPrincipal PrincipalMember principal, String password) {
		
		if(encoder.matches(password, principal.getMember().getPassword())) {
			memberService.delete(id);
			session.invalidate();
			return "success";
		}
		return "fail";
	}
	
	//회원 리스트 전체보기 : 페이징, 검색
	@GetMapping("memberList")
	public String memberList(Model model,
				@PageableDefault(size=5, sort="id",
				direction = Direction.DESC)Pageable pageable,
				@RequestParam(required = false,defaultValue = "") String field,
				@RequestParam(required = false,defaultValue = "") String word) {
			Page<Member> mlists = memberService.findAll(field, word, pageable);
			Long count = memberService.count(field, word);
			model.addAttribute("count", count);
			model.addAttribute("mlist", mlists);
			return "/user/memberList";
		}

}
