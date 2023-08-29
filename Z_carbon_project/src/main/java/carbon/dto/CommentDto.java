package carbon.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class CommentDto {
	Integer level;
	Integer cmt_idx;
	Integer member_idx;
	String cmt_content;
	Integer board_idx;
	Integer cmt_upidx; // 상위 댓글
	Timestamp cmt_date;
	
	MemberDto memberdto;
}
