package carbon.dto;

import lombok.Data;

@Data
public class CbntrdataDto { // data테이블 값 dto
	
	Integer cate_sn_1;	// 인벤토리 sn
	String lev_1;   	// 인벤토리
	Integer cate_sn_2;	// 배출법 sn
	String lev_2; 		// 배출법
	Integer cate_sn_3;	// 대분류 sn
	String lev_3;		// 대분류
	
	Integer data_sn;
	Integer data_date;
	Integer data_val;
	
	Integer prdt_sn;	// 활동자료 sn
	String prdt_nm;		// 활동자료명
	
}
