package carbon.serviceimpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import carbon.dto.CommentDto;
import carbon.mapper.CommentMapper;
import carbon.service.CommentService;

@Service
public class CommentServiceimple implements CommentService {

	@Autowired
	CommentMapper commentmapper;
	
	@Override
	public List<CommentDto> comment_list(Integer board_idx) {
		// TODO Auto-generated method stub
		return commentmapper.comment_list(board_idx);
	}

	@Override
	public Integer comment_count(Integer board_idx) {
		// TODO Auto-generated method stub
		return commentmapper.comment_count(board_idx);
	}

	@Override
	public int commemt_insert(CommentDto commentdto) {
		return commentmapper.comment_insert(commentdto);
	}

}
