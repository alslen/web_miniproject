package com.example.camping.repository;

import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.camping.model.Member;

public interface MemberRepository extends JpaRepository<Member, Long> {
	Member findByusername(String username);
	
	@Query(value="select count(*) from member where username > ?1",  nativeQuery = true)
	public int idcheck(String username);
	
	//@Query (value="select count(*) from member where username=#{username}", nativeQuery = true)
	//String findById(String username);
	
	// 검색 and 페이징(아이디)
	@Query(value="select * from member where username like CONCAT('%',:word,'%')",
			nativeQuery = true)
	public Page<Member> findByUsername(@Param("word")String word, Pageable pageable);
	
	// 검색 and 페이징(전화번호)
	@Query(value="select * from member where phone like CONCAT('%',:word,'%')",
			nativeQuery = true)
	public Page<Member> findByPhone(@Param("word") String word, Pageable pageable);
	
	@Query(value="select count(*) from member where username like CONCAT('%',:word,'%')",
			nativeQuery = true)
	public Long cntUsername(@Param("word") String word);
	@Query(value="select count(*) from member where phone like CONCAT('%',:word,'%')",
			nativeQuery = true)
	public Long cntPhone(@Param("word") String word);
	
	// 카카오 로그인
	public Member findById(String id);
	public Member  findByName(String name);
	public Member  findByEmail(String email);
	
	// 생년월일 수정
	@Query(value="select SUBSTR(birth, 1, 4) from member where id=?1", nativeQuery = true)
	public String findByIdBirthYear(Long id);
	
	@Query(value="select SUBSTR(birth, 5, 2) from member where id=?1", nativeQuery = true)
	public String findByIdBirthMonth(Long id);
	
	@Query(value="select SUBSTR(birth, 7, 2) from member where id=?1", nativeQuery = true)
	public String findByIdBirthDay(Long id);
	    
}
