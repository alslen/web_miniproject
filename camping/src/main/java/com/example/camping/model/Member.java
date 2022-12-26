package com.example.camping.model;


import java.sql.Timestamp;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import org.hibernate.annotations.CreationTimestamp;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Getter @Setter
@Entity
public class Member{

	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(nullable = false)
	private String username;  // 아이디
	private String password;  // 비밀번호
	private String name;  // 이름
	private String email; // 이메일
	private String birth; // 생년월일
	private String phone;  // 전화번호
	private String role;
	private Long kakaoId;
	@CreationTimestamp
    private Timestamp createTime;
	
	@JsonIgnore
	@OneToMany(mappedBy = "member", cascade = CascadeType.REMOVE)
	private List<Review> review;
	
	@OneToMany(mappedBy = "member", cascade = CascadeType.REMOVE)
	@JsonIgnore
	private List<Booking> booking;
	
	@JsonIgnore
	@OneToMany(mappedBy = "id", cascade = CascadeType.REMOVE)
	private List<Wishlist> wishList;
	
	// 카카오 로그인
	@Builder
	  public Member(String username ,String name, String password, String email, String role) {
	    this.username = username;
	    this.password = password;
	    this.name = name;
	    this.email = email;
	    this.role = role;
	}
}
