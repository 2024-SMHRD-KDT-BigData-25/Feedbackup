package com.smhrd.basic.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.beans.factory.annotation.Autowired;

import com.smhrd.basic.model.MavenMember;



@Mapper
public interface UserMapper {
	

	
	public int signup(MavenMember member);
	
	@Delete("delete from USERS where user_id = #{user_id}")
	public int delete(String user_id);
	
	// 아이디 중복 체크
	@Select("SELECT COUNT(*) FROM USERS WHERE user_id = #{userId}")
	Integer countByUserId(@Param("userId") String userId);
	
	// 이름과 이메일로 아이디를 찾는 메소드
    @Select("SELECT * FROM USERS WHERE name = #{name} AND email = #{email}")
    MavenMember idfind(@Param("name") String name, @Param("email") String email);
	
    // 이름과 이메일과 아이디로 패스워드를 찾는 메소드
    @Select("SELECT * FROM USERS WHERE name = #{name} AND email = #{email} AND user_id = #{user_id}")
    MavenMember pwfind(@Param("name") String name, @Param("email") String email, @Param("user_id") String user_id);
    
    // 이름 체크
	@Select("SELECT COUNT(*) FROM test WHERE name = #{name}")
	Integer countByname(@Param("name") String name);
	
	@Select("SELECT q_text FROM QUESTIONS WHERE job_code = #{jobCode} ORDER BY RAND() LIMIT 3")
	List<String> findQTextByJobCode(@Param("jobCode") String jobCode);
	
	@Select("SELECT a_text FROM QUESTIONS WHERE q_text = #{firstqText}")
	String findATextByfirstqText(@Param("firstqText") String firstqText);
	
	@Select("SELECT a_text FROM QUESTIONS WHERE q_text = #{secondqText}")
	String findATextBysecondqText(@Param("secondqText") String secondqText);
	
	@Select("SELECT a_text FROM QUESTIONS WHERE q_text = #{thirdqText}")
	String findATextBythirdqText(@Param("thirdqText") String thirdqText);
	
	@Select("SELECT question_id FROM QUESTIONS WHERE q_text = #{firstqText}")
	int findATextByfirstNumber(@Param("firstqText") String firstqText);

	@Select("SELECT question_id FROM QUESTIONS WHERE q_text = #{secondqText}")
	int findATextBysecondNumber(@Param("secondqText") String secondqText);

	@Select("SELECT question_id FROM QUESTIONS WHERE q_text = #{thirdqText}")
	int findATextBythirdNumber(@Param("thirdqText") String thirdqText);
	
	// 첫번째 분석 같은 아이디를 가진 사용자들 정보 가져오기
    @Select("SELECT * FROM ANALYSIS_Q1 WHERE user_id = #{user_id}")
    List<MavenMember> findUsersByANALYSIS_Q1(@Param("user_id") String user_id);
    
    // 두번째 분석 같은 아이디를 가진 사용자들 정보 가져오기
    @Select("SELECT * FROM ANALYSIS_Q2 WHERE user_id = #{user_id}")
    List<MavenMember> findUsersByANALYSIS_Q2(@Param("user_id") String user_id);
    
    // 세번째 분석 같은 아이디를 가진 사용자들 정보 가져오기
    @Select("SELECT * FROM ANALYSIS_Q3 WHERE user_id = #{user_id}")
    List<MavenMember> findUsersByANALYSIS_Q3(@Param("user_id") String user_id);
    
    // 질문번호로 기업을 찾기
    @Select("SELECT JOB_CODE FROM QUESTIONS WHERE question_id = #{question_id}")
    String findbyquestionid(@Param("question_id") int question_id);

    // 분석2 질문번호로 기업을 찾기
    @Select("SELECT JOB_CODE FROM ANALYSIS_Q2 WHERE question_id = #{question_id}")
    String findbyquestionid2(@Param("question_id") int question_id);
    
    // 분석1 질문번호로 기업을 찾기
    @Select("SELECT JOB_CODE FROM ANALYSIS_Q3 WHERE question_id = #{question_id}")
    String findbyquestionid3(@Param("question_id") int question_id);
    
    @Select("SELECT * FROM QUESTIONS")
    List<MavenMember> getqanda();
    
    public int get_session(MavenMember member);
}

