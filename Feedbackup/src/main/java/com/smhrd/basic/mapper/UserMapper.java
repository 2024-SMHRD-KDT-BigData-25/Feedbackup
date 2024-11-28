package com.smhrd.basic.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
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
	
	@Select("SELECT COUNT(*) FROM test WHERE id = #{userId}")
    int countById(String userId); // 아이디 중복 확인을 위한 쿼리

}

