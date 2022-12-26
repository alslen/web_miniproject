package com.example.camping.service;

import com.example.camping.model.KakaoProfile;

import com.example.camping.model.Member;
import com.example.camping.model.OAuthToken;
import com.example.camping.repository.MemberRepository;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.security.oauth2.resource.OAuth2ResourceServerProperties.Jwt;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.config.annotation.web.configurers.oauth2.server.resource.OAuth2ResourceServerConfigurer.JwtConfigurer;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.filter.CorsFilter;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Date;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

@Service
public class OAuthService {
   
    @Autowired
    MemberRepository memberRepository;

 
    @Autowired
    AuthenticationManager authenticationManager;
    @Autowired
   private BCryptPasswordEncoder encoder; 
    
    
   @Value("${key}")
   private String rootKey;
   
    public OAuthToken getAccessToken(String code) {

        // POST 방식으로 key=value 데이터 요청
        RestTemplate rt = new RestTemplate();

        // HttpHeader 오브젝트 생성
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

        // HttpBody 오브젝트 생성
        MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
        params.add("grant_type", "authorization_code");
        params.add("client_id", "25e9068a898c848763a0508296b6cc0b");
        params.add("redirect_uri", "http://localhost:7800/auth/kakao/callback");
        params.add("code", code);
        //params.add("client_secret", client_secret);

        // HttpHeader 와 HttpBody 정보를 하나의 오브젝트에 담음
        HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest =
                new HttpEntity<>(params, headers);

        // Http 요청 (POST 방식) 후, response 변수의 응답을 받음
        ResponseEntity<String> accessTokenResponse = rt.exchange(
                "https://kauth.kakao.com/oauth/token",
                HttpMethod.POST,
                kakaoTokenRequest,
                String.class
        );

        // JSON 응답을 객체로 변환
        ObjectMapper objectMapper = new ObjectMapper();
        OAuthToken oauthToken = null;
        try {
            oauthToken = objectMapper.readValue(accessTokenResponse.getBody(), OAuthToken.class);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        
        System.out.println(code);
        return oauthToken;
    }

    public KakaoProfile findProfile(String token) {
        // POST 방식으로 key=value 데이터 요청
        RestTemplate rt = new RestTemplate();

        // HttpHeader 오브젝트 생성
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "Bearer " + token);
        headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

        // HttpHeader 와 HttpBody 정보를 하나의 오브젝트에 담음
        HttpEntity<MultiValueMap<String, String>> kakaoProfileRequest =
                new HttpEntity<>(headers);

        // Http 요청 (POST 방식) 후, response 변수의 응답을 받음
        ResponseEntity<String> kakaoProfileResponse = rt.exchange(
                "https://kapi.kakao.com/v2/user/me",
                HttpMethod.POST,
                kakaoProfileRequest,
                String.class
        );

        // JSON 응답을 객체로 변환
        ObjectMapper objectMapper = new ObjectMapper();
        KakaoProfile kakaoProfile = null;
        try {
            kakaoProfile = objectMapper.readValue(kakaoProfileResponse.getBody(), KakaoProfile.class);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }

        return kakaoProfile;
    }

    public Member getUser(HttpServletRequest request) {
        String id =  (String) request.getAttribute("id");

        Member member = memberRepository.findById(id);

        return member;
    }

    public Member saveUserAndGetToken(String token) {
        KakaoProfile profile = findProfile(token);
       // System.out.println("profile : " + profile);

     String getId = profile.getId();
      Member member =  memberRepository.findByusername(getId);
      // System.out.println("member ---> " + member);
  //     
      // Member member =  memberRepository.findByusername(token);
        
//        String getEmail = profile.getKakao_account().getEmail();
//        System.out.println("getEmail : " + getEmail);
        
        if(member == null) {
           member= Member.builder()
                    .username(profile.getId())
                                   .password(rootKey)
                                      .name(profile.getKakao_account().getProfile().getNickname())
                    .email(profile.getKakao_account().getEmail())
                    .role("ROLE_USER").build();
        
        
          String rawPassword = member.getPassword();
          String encPassword = encoder.encode(rawPassword);
          member.setPassword(encPassword); //암호화 된 비번
          member.setRole("ROLE_KAKAO");
          
           
          
           memberRepository.save(member);
           Authentication saveUserAndGetToken = new  UsernamePasswordAuthenticationToken(member.getUsername(),rootKey);
          System.out.println("토큰"+saveUserAndGetToken);
          Authentication authentication = authenticationManager.authenticate(saveUserAndGetToken);
           SecurityContextHolder.getContext().setAuthentication(saveUserAndGetToken);
            
        
        }
      
        
        return member ;
    }
   
   @Transactional 
public Member memberfind(String username) {
   return memberRepository.findByusername(username);
}
    

 public void logout(String access_Token) {
       String reqURL = "https://kapi.kakao.com/v1/me/logout";
       try {
            
           URL url = new URL(reqURL);
           HttpURLConnection conn = (HttpURLConnection) url.openConnection();
           conn.setRequestMethod("POST");
           conn.setRequestProperty("Authorization", "Bearer " + access_Token);
           
           int responseCode = conn.getResponseCode();
           
           System.out.println("responseCode : " + responseCode);
           
          
       } catch (IOException e) {
           e.printStackTrace();
       }
   }
 }

