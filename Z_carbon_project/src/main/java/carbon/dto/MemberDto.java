package carbon.dto;

import java.sql.Timestamp;


import lombok.Data;

@Data
public class MemberDto {
	
	Integer user_sn; //pk
	String user_id; //사용자 아이디
	String user_pwd; //사용자 비밀번호
	String user_nm; //사용자 성명
	String user_note; //비고 
	Timestamp regist_dt; //등록일시
	String register_id; //등록자 아이디
	Timestamp updt_dt; //수정일시
	String updt_id; //수정자 아이디
	String user_yn; //사용여부
	String role; //권한
	
}
