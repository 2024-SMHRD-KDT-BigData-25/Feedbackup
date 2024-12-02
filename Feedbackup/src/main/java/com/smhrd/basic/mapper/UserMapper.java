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
	
	// 이메일과 휴대폰 번호로 아이디와 이름을 찾는 메소드
    @Select("SELECT id, name FROM test WHERE email = #{email} AND phone = #{phone}")
    MavenMember idandnamefind(@Param("email") String email, @Param("phone") String phone);
}

