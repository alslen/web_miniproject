package com.example.camping.model;

import com.example.camping.repository.MemberRepository;
import com.example.camping.service.OAuthService;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

//@Data

@Getter
@Setter
public class KakaoProfile {
	 public String id;
	    public String connected_at;
	    public Properties properties;
	    public KakaoAccount kakao_account;

//	    @Data
	    @Getter
	    @Setter
	    public class Properties { //(1)
	        public String nickname;
	        public String profile_image; // 이미지 경로 필드1
	        public String thumbnail_image;
	    }
	    
//	    @Data
	   
	    @Getter
	    @Setter
	    public class KakaoAccount { //(2)
	        public Boolean profile_nickname_needs_agreement;
	        public Boolean profile_image_needs_agreement;
	        public Profile profile;
	        public Boolean has_email;
	        public Boolean email_needs_agreement;
	        public Boolean is_email_valid;
	        public Boolean is_email_verified;
	        public String email;

//	        @Data
	        @Getter
	        @Setter
	        public class Profile {
	            public String nickname;
	            public String thumbnail_image_url;
	            public String profile_image_url; // 이미지 경로 필드2
	            public Boolean is_default_image;
	        }
	    }

}
