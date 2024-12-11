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
	
	@Delete("delete from USERS where user_id = #{id}")
	public int delete(String id);
	
	// 아이디 중복 체크
	@Select("SELECT COUNT(*) FROM USERS WHERE user_id = #{userId}")
	Integer countByUserId(@Param("userId") String userId);
	
	// 이름과 이메일로 아이디를 찾는 메소드
    @Select("SELECT * FROM test WHERE name = #{name} AND email = #{email}")
    MavenMember idfind(@Param("name") String name, @Param("email") String email);
	
    // 이름과 이메일과 아이디로 패스워드를 찾는 메소드
    @Select("SELECT * FROM test WHERE name = #{name} AND email = #{email} AND id = #{id}")
    MavenMember pwfind(@Param("name") String name, @Param("email") String email, @Param("id") String id);
    
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
	
	// 같은 이름을 가진 사용자들 정보 가져오기
    @Select("SELECT * FROM test WHERE name = #{name}")
    List<MavenMember> findUsersByName(@Param("name") String name);
    
    @Select("SELECT * FROM QUESTIONS")
    List<MavenMember> getqanda();
}

