package com.example.camping.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.camping.model.Member;
import com.example.camping.repository.MemberRepository;

@Transactional(readOnly=true)
@Service
public class MemberService {
	@Autowired
	private BCryptPasswordEncoder encoder; 
	@Autowired
	private MemberRepository memberRepository;
	
	//회원가입
	@Transactional
	public void register(Member member) {
		//비번 암호화 시키고 추가
		String rawPassword = member.getPassword();
		String encPassword = encoder.encode(rawPassword);
		member.setPassword(encPassword); //암호화 된 비번
		member.setRole("ROLE_ADMIN");
		memberRepository.save(member);
	
	}
	
	//아이디 중복 체크
	public int idCheck(String username) {
		return memberRepository.idcheck(username);
	}
	//회원 정보 수정 폼
	public Member findById(Long id) {
		Member member = memberRepository.findById(id).get();
		return member;
	}
	@Transactional
	public void update(Member member) {
		Member m = memberRepository.findById(member.getId()).get();
		m.setUsername(member.getUsername());
		m.setName(member.getName());
		m.setEmail(member.getEmail());
		m.setBirth(member.getBirth());
		m.setPhone(member.getPhone());
	}
	@Transactional
	public void delete(Long id) {
		memberRepository.deleteById(id);
	}
	
	public Page<Member> findAll(String field, String word, Pageable pageable) {
		Page<Member> lists = memberRepository.findAll(pageable);
		if(field.equals("username")) {
			lists = memberRepository.findByUsername(word, pageable);
		}else if(field.equals("phone")) {
			lists = memberRepository.findByPhone(word, pageable);
		}
		return lists;
	}
	//검색 카운트
	public Long count (String field, String word) {
		Long count = memberRepository.count();
		if(field.equals("username")) {
			count = memberRepository.cntUsername(word);
		}else if(field.equals("phone")) {
			count = memberRepository.cntPhone(word);
		}
		return count;
	}
}
