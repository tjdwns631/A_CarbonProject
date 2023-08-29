package carbon.controller;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import carbon.dto.BoardDto;
import carbon.dto.CommentDto;
import carbon.service.CommentService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CommentController {
	
	@Autowired
	CommentService commentservice;
	
	@ResponseBody
	@RequestMapping("/CommentAction.do") //댓글 작성
	public int write_action(@RequestParam("member_idx") Integer member_idx,@RequestParam("board_idx") Integer board_idx,
			@RequestParam("cmt_content") String cmt_content,@RequestParam("cmt_upidx") Integer cmt_upidx, CommentDto commentdto ) throws Exception { // 현재 날짜/시간
		
		
		System.out.println("member_idx:"+member_idx); //Object여서 형 변환
		System.out.println("board_idx:"+board_idx);
		System.out.println("cmt_content:"+cmt_content);
		System.out.println("cmt_upidx:"+cmt_upidx);
		
		/*
		 * LocalDateTime datetime = LocalDateTime.now(); DateTimeFormatter formatter =
		 * DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"); String now =
		 * datetime.format(formatter);
		 */
		
		Timestamp datetime = Timestamp.valueOf(LocalDateTime.now());
		 
		commentdto.setMember_idx(member_idx);
		commentdto.setBoard_idx(board_idx);
		commentdto.setCmt_content(cmt_content);
		commentdto.setCmt_upidx(cmt_upidx);
		commentdto.setCmt_date(datetime);
		int result = commentservice.commemt_insert(commentdto);
		System.out.println(commentdto.getCmt_idx());
		System.out.println(commentdto.getCmt_idx());
		System.out.println(result);
		System.out.println(result);
		
		if(result != 0 ) {
			return result;
		}else{
			return 0;
		}
	  
	  }
	
	@RequestMapping("/getCommentList_Action.do") // ajax 댓글 리스트 
	@ResponseBody
	public Map<String, Object> getCommentList_Action(@RequestParam("board_idx") Integer board_idx,
			HttpServletRequest request, HttpServletResponse response) throws Exception { 

		/* 댓글 조회 */
		List<CommentDto> c_list = commentservice.comment_list(board_idx);
		Integer c_count = commentservice.comment_count(board_idx);
		log.info("c_list ={}", c_list);
		Map<String, Object> output = new HashMap<>();
		output.put("c_list", c_list);
		output.put("c_count", c_count);

		return output;

	}
}

