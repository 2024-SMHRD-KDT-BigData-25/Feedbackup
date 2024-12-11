package com.smhrd.basic.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor //기본생성자
@Setter
@Getter
@ToString
public class MavenMember {
	
	private String name;
	private String id;
	private String pw;
	private String nickname;
	private String email;
	private String job_code;
	private String q_text;
	private String a_text;

}
