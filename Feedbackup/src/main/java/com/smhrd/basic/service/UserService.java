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
        return mapper.pwfind(name, email, id);  // 매개변수를 name과 email id로 수정
    }
    
    // 이름으로 개수 찾기
    public int checkcount(String name) {
    	return mapper.countByname(name);
    }
    
    // 
    public List<String> getQTextByJobCode(String jobCode) {
        return mapper.findQTextByJobCode(jobCode);
    }
    
    // q_text를 기준으로 a_text를 가져오는 메서드
    public String getATextByfirstqText(String firstqText) {
        return mapper.findATextByfirstqText(firstqText);
    }
    
 // q_text를 기준으로 a_text를 가져오는 메서드
    public String getATextBysecondqText(String secondqText) {
        return mapper.findATextBysecondqText(secondqText);
    }
    
 // q_text를 기준으로 a_text를 가져오는 메서드
    public String getATextBythirdqText(String thirdqText) {
        return mapper.findATextBythirdqText(thirdqText);
    }
    
// q_text를 기준으로 QUESTION_ID를 가져오는 메서드
    public int getATextByfirstNumber(String firstqText) {
        return mapper.findATextByfirstNumber(firstqText);
    }
    
 // q_text를 기준으로 QUESTION_ID를 가져오는 메서드
    public int getATextBysecondNumber(String secondqText) {
        return mapper.findATextBysecondNumber(secondqText);
    }
    
 // q_text를 기준으로 QUESTION_ID를 가져오는 메서드
    public int getATextBythirdNumber(String thirdqText) {
        return mapper.findATextBythirdNumber(thirdqText);
    }
    
 // 이름을 기준으로 사용자 정보를 찾는 메소드
    public List<MavenMember> findUsersByName(String name) {
        return mapper.findUsersByName(name);
    }
    
 // 회원 목록 조회
    public List<MavenMember> getqanda() {
        return mapper.getqanda();
    }
}
