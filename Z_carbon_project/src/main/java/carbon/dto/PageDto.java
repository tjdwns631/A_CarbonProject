package carbon.dto;

import lombok.Data;

@Data
public class PageDto {
	
	// 보여줄 게시글 수
	private int listSize = 3;    
	// 페이지 범위
	private int rangeSize = 3;            

	private int page;

	private int range;

	private int listcnt;

	private int pageCnt;

	private int startPage;

	private int startList;

	private int endPage;

	private boolean prev;

	private boolean next;

	public void pageInfo(int page, int range, int listcnt) {

		this.page = page;

		this.range = range;

		this.listcnt = listcnt;

		//전체 페이지수 

		this.pageCnt = (int) Math.ceil((double)listcnt/listSize);

		//시작 페이지

		this.startPage = (range - 1) * rangeSize + 1 ;

		//끝 페이지

		this.endPage = range * rangeSize;

		//게시판 시작번호

		this.startList = (page - 1) * listSize;

		//이전 버튼 상태

		this.prev = range == 1 ? false : true;

		//다음 버튼 상태

		this.next = pageCnt > endPage ? true : false;

		if (this.endPage > this.pageCnt) {

			this.endPage = this.pageCnt;

			this.next = false;

		}

	}
	
}
