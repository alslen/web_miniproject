package com.example.camping.repository;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.example.camping.model.Member;
import com.example.camping.model.WishListDTO;
import com.example.camping.model.Wishlist;

public interface LikeRepository extends JpaRepository<Wishlist, Long>{

	//Optional<Wishlist> findByCamping_camp_idAndMember_Id(Long camp_id, Long id);
//	void deleteByCampingAndId(Long camp_id, Long id);
	
	@Query(value = "select * from wishlist where camping=?1 and member_id=?2", nativeQuery = true)
	public Wishlist findByLike(Long camping, Long id);
	
	@Query(value = "delete * from wishlist where camping=?1 and member_id=?2", nativeQuery = true)
	public void deleteByLike(Long camping, Long id);
	
	//public void deleteById_Id(Long member_id);
	
	@Query(value="delete * from wishlist where member_id=?1 and camping=?2", nativeQuery = true)
	public void deleteLike(Long member_id, Long camping);
	
	@Query(value="select * from wishlist where member_id=?1", nativeQuery = true)
	public List<Wishlist> findByMember(Long id);
	
	@Query(value="select count(*) from wishlist where member_id=?1", nativeQuery = true)
	public int likeCnt(Long id);
	

}
