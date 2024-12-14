package com.smhrd.basic.model;

import java.time.LocalDate;

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
	private String user_id;
	private String id;
	private String pw;
	private String nickname;
	private String email;
	private String job_code;
	private String q_text;
	private String a_text;
	private LocalDate created;
	private int question_id;
	private int session_id;

}
