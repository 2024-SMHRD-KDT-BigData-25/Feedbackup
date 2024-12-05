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
	
	@Delete("delete from mavenmember where id = #{id}")
	public int delete(String id);
	
	@Update("update mavenmember set pw =#{pw}, nickname=#{nickname} where id = #{id}")
	public int update(MavenMember member);
	
	@Select("select * from mavenmember")
	public List<MavenMember> getList();
	
	// 아이디 중복 체크
	@Select("SELECT COUNT(*) FROM test WHERE id = #{userId}")
	Integer countByUserId(@Param("userId") String userId);
	
	// 이름과 이메일로 아이디를 찾는 메소드
    @Select("SELECT id,name FROM test WHERE name = #{name} AND email = #{email}")
    MavenMember idfind(@Param("name") String name, @Param("email") String email);
	
    // 이름과 이메일과 아이디로 패스워드를 찾는 메소드
    @Select("SELECT pw,name,id FROM test WHERE name = #{name} AND email = #{email} AND id = #{id}")
    MavenMember pwfind(@Param("name") String name, @Param("email") String email, @Param("id") String id);
}

