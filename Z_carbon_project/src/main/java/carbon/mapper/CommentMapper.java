package carbon.mapper;

import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import carbon.dto.CommentDto;

@Mapper("commentMapper")
public interface CommentMapper {

	List<CommentDto> comment_list(Integer board_idx);

	Integer comment_count(Integer board_idx);

	int comment_insert(CommentDto commentdto);
	
}
