package com.example.camping.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.example.camping.model.Booking;

public interface BookingRepository extends JpaRepository<Booking, Long>{

	@Query(value="select * from booking where member_id=?1", nativeQuery = true)
	public List<Booking> findByMember(Long member_id);
	
	@Query(value = "select count(*) from booking where member_id=?1", nativeQuery = true)
	public int findByCount(Long member_id);
	
	@Query(value = "delete from booking where check_out<now()", nativeQuery = true)
	public void cancleCheck(Date check_in, Date check_out);
}
