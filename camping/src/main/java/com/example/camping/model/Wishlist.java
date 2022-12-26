package com.example.camping.model;

import javax.persistence.Entity;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.PrePersist;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Getter @Setter
@Entity
public class Wishlist {

	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long wishNum;
	
	@ManyToOne
	@JoinColumn(name = "member_id")
	private Member id;
	
	@ManyToOne
	@JoinColumn(name = "camping")
	private Camping camping;
	
	public static Wishlist toWishlist(Member id, Camping camping) {
		Wishlist wishlist = new Wishlist();
		wishlist.setId(id);
		wishlist.setCamping(camping);
		
		return wishlist;
	}
}
