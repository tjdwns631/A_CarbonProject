package carbon.dto;

import lombok.Data;

@Data
public class CategoryDto {

	Integer cate_sn; // pk
	String cate_nm; // 카테고리명칭
	String cate_note; // 카테고리 설명
	Integer cate_upr_sn; // 상위카테고리 key
	Integer cate_rank; // 카테고리 레벨
	
	String lev1;
	String lev2;
	String lev3;
	
}
