package com.smhrd.basic.service;

import org.springframework.stereotype.Service;

import com.smhrd.basic.mapper.AuthMapper;
import com.smhrd.basic.model.MavenMember;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class AuthService {
	
	private final AuthMapper mapper;
	
	public MavenMember login(MavenMember member) {
		return mapper.login(member);
	}
	
}
