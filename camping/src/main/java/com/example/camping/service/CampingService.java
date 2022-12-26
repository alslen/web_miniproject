package com.example.camping.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.example.camping.model.Camping;
import com.example.camping.model.Member;
import com.example.camping.model.Picture;
import com.example.camping.model.Wishlist;
import com.example.camping.repository.CampingRepository;
import com.example.camping.repository.LikeRepository;
import com.example.camping.repository.MemberRepository;
import com.example.camping.repository.PictureRepository;

@Service
@Transactional
public class CampingService {

	@Autowired
	private CampingRepository campRepository;

	@Autowired
	private PictureRepository pictureRepository;

	@Autowired
	private LikeRepository likeRepository;


	// 캠핑장 추가
	public void insert(Camping camp) {

		UUID uuid = UUID.randomUUID();
		List<MultipartFile> fileList = camp.getUpload();
		String uploadFileName = "";
		if (!fileList.isEmpty()) {
			for (MultipartFile f : fileList) {
				uploadFileName = uuid.toString() + "_" + f.getOriginalFilename();
				File saveFile = new File(uploadFileName);
				Picture p = new Picture();
				p.setCamping(camp);
				p.setPic_name(uploadFileName);
				pictureRepository.save(p);
				try {
					f.transferTo(saveFile);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
			}
		}

		campRepository.save(camp);
	}

	// 캠핑장 리스트
	@Transactional
	public List<Camping> list() {
		return campRepository.findAll();
	}

	// 캠핑장 상세보기
	public Camping detail(Long camp_id) {
		return campRepository.findById(camp_id).get();
	}

	// 삭제
	public void delete(Long camp_id) {
		campRepository.deleteById(camp_id);
	}

	// 캠핑장 수정
	@Transactional
	public void update(Camping camping) {
		
		
		
		UUID uuid = UUID.randomUUID();
		List<MultipartFile> fileList = camping.getUpload();
		String uploadFileName = "";
		if (!fileList.isEmpty()) {
			for (MultipartFile f : fileList) {
				uploadFileName = uuid.toString() + "_" + f.getOriginalFilename();
				File saveFile = new File(uploadFileName);
				Picture p = new Picture();
				p.setCamping(camping);
				p.setPic_name(uploadFileName);
				System.out.println("p : " + p);
				pictureRepository.save(p);
				
				try {
					f.transferTo(saveFile);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
			}
		}
		Camping c = campRepository.findById(camping.getCamp_id()).get();
		c.setAddress(camping.getAddress());
		c.setCamp_category(camping.getCamp_category());
		c.setCamp_email(camping.getCamp_email());
		c.setCamp_tel(camping.getCamp_tel());
		c.setCamp_title(camping.getCamp_title());
		c.setCount(camping.getCount());
		c.setMaster(camping.getMaster());
		c.setRoom_info(camping.getRoom_info());
		c.setPrice(camping.getPrice());
	}
	
	// 좋아요 눌렀는지 확인
	public int findLike(Long camp_id, Long id) { 
		  Wishlist findLike = likeRepository.findByLike(camp_id, id);
		  if(findLike == null) { return 0; } 
		  else { return 1; } 
		  
	  }
	
	  // 좋아요
		@Transactional
		public int saveLike(Wishlist wishlist) {
			
			 Wishlist findLike = likeRepository.findByLike(wishlist.getCamping().getCamp_id(), wishlist.getId().getId());
		
			 if(findLike == null) {
				 Camping c= campRepository.findById(wishlist.getCamping().getCamp_id()).get();
				 c.setLikeCnt(c.getLikeCnt()+1);  // 좋아요 개수 1증가
				 likeRepository.save(wishlist);
				
				 return 1;
			 }
			 else {
				 Camping c = campRepository.findById(wishlist.getCamping().getCamp_id()).get();
				 c.setLikeCnt(c.getLikeCnt()-1);
				 likeRepository.delete(findLike);
				 return 0;
			 }
				
		}
		
		// 캠핑장 인기 순
		public List<Camping> campLike(){
			return campRepository.campLike();
		}
		
		// 캠핑장 최신 순
		public List<Camping> campNew(){
			return campRepository.campNew();
		}
		
		//캠핑 아이디
        public Camping findById(Long camp_id) {
           Camping camping = campRepository.findById(camp_id).get();
           return camping;
        }
        
      //검색
    	public List<Camping> search(String address,String camp_title){
    		List<Camping> lists = campRepository.Search(address,camp_title);
    		return lists;
    	}



}
