package carbon.service;

import java.util.List;

import carbon.dto.CommentDto;

public interface CommentService {

	List<CommentDto> comment_list(Integer board_idx);

	Integer comment_count(Integer board_idx);

	int commemt_insert(CommentDto commentdto);

}
