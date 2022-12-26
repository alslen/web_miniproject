package com.example.camping.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PrePersist;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.CreationTimestamp;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
@Entity
public class Pay {

	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long payCode;  // 결제코드
	
	private String payment;  // 결제수단
	private Long price;  // 가격
	
	@CreationTimestamp
	@Temporal(TemporalType.TIMESTAMP)
	private Date payDate;  // 결제 날짜
	private Long payCheck; // 결제 여부
	private Long refundCheck;  // 환불여부
	
	@PrePersist //DB에 해당 테이블의 insert연산을 실행 할 때 같이 실행
	public void prePerist() { // 초기 값을 지정
		this.price = this.price==null?0:this.price;
		this.payCheck = this.payCheck==null?0:this.payCheck;
		this.refundCheck = this.refundCheck==null?0:this.refundCheck;
	}
	
}
