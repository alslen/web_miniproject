package com.example.camping.config.auth;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.example.camping.model.Member;
import com.example.camping.repository.MemberRepository;

@Service
public class PrincipalDetails implements UserDetailsService {
	@Autowired
	private MemberRepository memberRepository;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
	   System.out.println("loadUserByUsername");
	  Member member =   memberRepository.findByusername(username);
	  if(member ==null) return null;
	  // 회원이라면 시큐리티가 적용되 User 리턴
	  PrincipalMember puser = new PrincipalMember(member);
	  System.out.println("puser :" + puser);
		return puser;
	}

}
