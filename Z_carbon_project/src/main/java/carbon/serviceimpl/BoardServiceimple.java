package carbon.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import carbon.dto.BoardDto;
import carbon.dto.CommentDto;
import carbon.dto.PageDto;
import carbon.dto.Search;
import carbon.mapper.BoardMapper;
import carbon.service.BoardService;

@Service
public class BoardServiceimple implements BoardService {

	@Autowired
	private BoardMapper boardmapper;


	@Override
	public void board_insert(BoardDto boardDto) throws Exception {
		
		boardmapper.board_insert(boardDto);
	}


	@Override
	public List<BoardDto> board_list(Search search) throws Exception {
		
		return boardmapper.board_list(search);
	}



	@Override
	public BoardDto board_getlist(Integer board_idx) throws Exception {
		return boardmapper.board_getlist(board_idx);
	}


	@Override
	public void board_hitsupd(Integer board_idx) throws Exception {
		boardmapper.board_hitsupd(board_idx);
	}


	@Override
	public int board_listcnt(Search search) throws Exception {
		return boardmapper.board_listcnt(search);
	}

}
