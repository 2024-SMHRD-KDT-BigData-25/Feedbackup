package com.smhrd.basic.service;

import java.util.List;
import java.util.Optional;

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
    public String idfind(String name, String email) {
        // 이름이 존재하는지 확인
        MavenMember member = mapper.namefind(name);  // Optional 제거, null 체크로 변경
        
        if (member == null) {
            return "이름이 존재하지 않습니다.";  // 이름이 데이터베이스에 없음
        }
        
        // 이름은 존재하고 이메일도 확인
        if (!member.getEmail().equals(email)) {
            return "이메일이 틀렸습니다.";  // 이메일이 맞지 않음
        }
        
        return member.getId();  // 이메일이 일치하면 아이디 반환
    }
}
