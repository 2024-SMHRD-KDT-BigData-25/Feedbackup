package com.smhrd.basic.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smhrd.basic.mapper.UserMapper;
import com.smhrd.basic.model.MavenMember;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor // Lombok, final이 붙은 필드의 생성자를 자동으로 만들어줌
@Service
public class UserService {
    
    private final UserMapper mapper;
    
    // 회원가입 처리
    public int signup(MavenMember member) {
        return mapper.signup(member);
    }
    
    // 회원탈퇴 처리
    public int delete(String id) {
        return mapper.delete(id);
    }
    
    // 회원 정보 수정
    public int update(MavenMember member) {
        return mapper.update(member);
    }
    
    // 회원 목록 조회
    public List<MavenMember> getList() {
        return mapper.getList();
    }
    
    // 아이디 중복 확인
    public boolean checkIdExist(String userId) {
        int count = mapper.countById(userId);
        return count > 0;  // 중복된 아이디가 있으면 true 반환
    }
}
