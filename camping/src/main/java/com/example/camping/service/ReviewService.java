package com.example.camping.service;

import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.camping.model.Review;
import com.example.camping.repository.ReviewRepository;

@Service
public class ReviewService {

	@Autowired
	private ReviewRepository reviewRepository;
	
	// 댓글 추가
	public void insert(Review review) {
		reviewRepository.save(review);
	}
	
	// 댓글 리스트
	public List<Review> list(Long camp_id){
		return reviewRepository.findByCamping(camp_id);
	}
	
	// 댓글 개수
	public int count(Long camp_id) {
		List<Review> rlist = reviewRepository.findByCamping(camp_id);
		return rlist.size();
	}
	
	// 댓글 삭제
	public void delete(Long reviewNum) {
		reviewRepository.deleteById(reviewNum);
	}
	
	// 댓글 상세보기
	public Review detail(Long reviewNum) {
		return reviewRepository.findById(reviewNum).get();
	}
	
	// 댓글 수정
	@Transactional
	public void update(Review review) {
		Review r = reviewRepository.findById(review.getReviewNum()).get();
		r.setContent(review.getContent());
		r.setScore(review.getScore());
		r.setReviewDate(new Date());
	}
	// 내가 쓴 리뷰
	public List<Review> myList(Long id){
		return reviewRepository.findByMember(id);
	}
		
	// 내가 쓴 리뷰 개수
	public int myCount(Long id) {
		return reviewRepository.reviewCount(id);
	}
}
