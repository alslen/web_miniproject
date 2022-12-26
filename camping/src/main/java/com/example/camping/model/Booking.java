package com.example.camping.model;

import java.util.Date;


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;

import org.springframework.data.annotation.Transient;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
@Entity
public class Booking {

	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long bookNum;  // 예약번호
	private String check_in;
	private String check_out;
	
	@ManyToOne
	@JoinColumn(name="member_id")
	@JsonIgnore
	private Member member;  // 고객 참조
	
	@ManyToOne
	@JoinColumn(name="camping_id")
	@JsonIgnore
	private Camping camping;  
	
	// 예약 상태(0:예약 대기, 1:예약 완료, 2: 예액 취소, 3:입실완료, 4:이용완료)
	private Long status;  
	
	@Transient
	private Long dayCnt;  // 날짜 차이
	
//	@ManyToOne
//	@JoinColumn(name="pay_code")
//	private Pay pay;
	
	@PrePersist
	public void prePerist() {
		this.status = this.status==null?0:this.status;
		this.dayCnt = this.dayCnt==null?0:this.dayCnt;
	}
}
