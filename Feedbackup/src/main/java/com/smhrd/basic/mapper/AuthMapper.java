package com.smhrd.basic.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.smhrd.basic.model.MavenMember;

@Mapper
public interface AuthMapper {
	
	@Select("select * from USERS where user_id = #{id} and pw = #{pw}")
	public MavenMember login(MavenMember member);

}
