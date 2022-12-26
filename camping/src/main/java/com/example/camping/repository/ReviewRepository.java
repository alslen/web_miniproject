package com.example.camping.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.example.camping.model.Review;

public interface ReviewRepository extends JpaRepository<Review, Long>{

	@Query(value="select * from review where camp=?1", nativeQuery = true)
	public List<Review> findByCamping(Long camp_id);
	
	@Query(value = "select * from review where member_id=?1",nativeQuery =  true)
	public List<Review> findByMember(Long id);
	
	@Query(value = "select count(*) from review where member_id=?1", nativeQuery = true)
	public int reviewCount(Long id);
}
