package com.example.camping.model;

import java.util.List;



import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;


import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
@Entity
public class Picture {

	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long pic_num;  // 사진 식별 번호
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="camp_id")
	@JsonIgnore
	private Camping camping;  
	
	private String pic_name; // 사진명

}
