package com.example.camping.model;

import java.util.Date;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrePersist;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.hibernate.annotations.CreationTimestamp;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
@Entity
public class Camping {
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long camp_id;
	private String camp_title;  // 캠핑장이름
	
	private String camp_tel; // 전화번호
	private String master; // 대표자 이름
	private String address;  // 주소
	private Long camp_category;  // 카테코리 코드(1:카라반 2: 글램핑 3:캠핑장)
	private String camp_email;  // 이메일

	private int count;  // 최대인원수
	private Long price;
	private String room_info;  // 객실정보
	
	private int likeCnt;  // 좋아요 개수
	
	@CreationTimestamp
	@Temporal(TemporalType.TIMESTAMP)
	private Date reg_date;  // 등록날짜
	
	@OneToMany(mappedBy = "camping", cascade = CascadeType.REMOVE)
	@JsonIgnoreProperties("camping")
	@JsonIgnore
	private List<Review> review;
	
	@OneToMany(mappedBy = "camping", cascade = CascadeType.REMOVE)
	@JsonIgnore
	private List<Wishlist> wishList;
	
	@OneToMany(mappedBy = "camping", cascade = CascadeType.REMOVE)
	private List<Picture> picture;
	
	@OneToMany(mappedBy = "camping", cascade = CascadeType.REMOVE)
	private List<Booking> booking;
	
	@Transient  // 컬럼에서 제외됨
	private List<MultipartFile> upload;  // 업로드할 파일
	
	@PrePersist
	public void prePerist() {
		this.price = this.price==null?0:this.price;
	}
	
}
