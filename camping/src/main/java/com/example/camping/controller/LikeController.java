package com.example.camping.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.camping.config.auth.PrincipalMember;
import com.example.camping.model.Wishlist;
import com.example.camping.service.LikeService;
import com.example.camping.service.MemberService;

@Controller
@RequestMapping("/like/*")
public class LikeController {

	@Autowired
	private LikeService likeService;
	
	@GetMapping("list/{id}")
	public String wlist(Model model, @PathVariable Long id) {
		model.addAttribute("wlist", likeService.list(id));
		model.addAttribute("count", likeService.count(id));
		return "/wishList/wlist";
	}
}
