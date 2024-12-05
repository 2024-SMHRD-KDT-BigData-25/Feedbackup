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
        // userMapper에서 id 중복 여부를 확인
        Integer count = mapper.countByUserId(userId);
        return count != null && count > 0;  // 중복이면 true, 아니면 false
    }
    
    // 이름과 이메일로 찾기
    public MavenMember idfind(String name, String email) {
        return mapper.idfind(name, email);  // 매개변수를 name과 email로 수정
    }
    // 이름과 이메일과 아이디로 패스워드찾기
    public MavenMember pwfind(String name, String email, String id) {
        return mapper.pwfind(name, email, id);  // 매개변수를 name과 email로 수정
    }
}
