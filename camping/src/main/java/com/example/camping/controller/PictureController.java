package com.example.camping.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.camping.service.PictureService;

@Controller
@RequestMapping("/picture/*")
public class PictureController {

	@Autowired
	private PictureService picService;
	
	// 이미지 삭제(x이미지를 클릭하면)
	@DeleteMapping("delete/{pic_num}")
	@ResponseBody
	public String delete(@PathVariable Long pic_num) {
		picService.delete(pic_num);
		return "success";
	}
}
