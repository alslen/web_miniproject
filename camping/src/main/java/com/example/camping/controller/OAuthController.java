package com.example.camping.controller;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.HashMap;
import java.util.Optional;
import java.util.UUID;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;


import com.example.camping.model.Member;
import com.example.camping.model.OAuthToken;
import com.example.camping.repository.MemberRepository;
import com.example.camping.service.OAuthService;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.AllArgsConstructor;



@Controller
@RequestMapping("/auth/kakao/*")
public class OAuthController {
//   @Value("${root.key}")
//   private String cosKey;
   @Autowired
   private OAuthService oauthService;

   @Autowired
   MemberRepository memberRepository;
   @Autowired
   private AuthenticationManager authenticationManager;
   private Member member;
   
    @GetMapping("callback")
    public String getLogin( @RequestParam("code") String code, HttpSession session) {

       OAuthToken oauthToken = 
          oauthService.getAccessToken(code);
    
       oauthService.saveUserAndGetToken(oauthToken.getAccess_token());
       //System.out.println("token======"+oauthToken);
          
    
   return "redirect:/main";

 }

//   @GetMapping(value = "callback")
//   @ResponseBody
//   public ResponseEntity<String> getLogin(@RequestParam String code, HttpSession session) {
//
//      OAuthToken oauthToken = oauthService.getAccessToken(code);
//
//      oauthService.saveUserAndGetToken(oauthToken.getAccess_token());
//
//      ///model.addAttribute(code);
//
//      return ResponseEntity.status(HttpStatus.OK).body("/index");
//
//   }
   
   

   @GetMapping("/me")
   @ResponseBody
   public ResponseEntity<Object> getCurrentUser(HttpServletRequest request) { // (1)

      // (2)
      Member member = oauthService.getUser(request);

      // (3)
      return ResponseEntity.ok().body(member);
   }

   @GetMapping(value = "/auth/kakao/logout")
   @ResponseBody
   public ResponseEntity<String> logout(HttpServletRequest request) throws URISyntaxException {
      HttpSession session = request.getSession(false);
      if (session != null) {
         session.invalidate();
      }
      URI redirectUri = new URI("/list");
      HttpHeaders headers = new HttpHeaders();
      headers.setLocation(redirectUri);
      return new ResponseEntity<>(headers, HttpStatus.FOUND);
//      @RequestMapping(value="/logout")
//      public String logout(HttpSession session) {
//          kakao.kakaoLogout((String)session.getAttribute("access_Token"));
//          session.removeAttribute("access_Token");
//          session.removeAttribute("userId");
//          return "index";
//      }
   }

}
