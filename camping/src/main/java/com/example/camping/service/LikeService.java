package com.example.camping.service;


import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.camping.model.Wishlist;
import com.example.camping.repository.LikeRepository;

@Service
public class LikeService {

	@Autowired
	private LikeRepository likeRepository;
	
	public List<Wishlist> list(Long id){
		
		return likeRepository.findByMember(id);
	}
	
	public int count(Long id) {
		return likeRepository.likeCnt(id);
	}
}
