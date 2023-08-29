package carbon.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import carbon.dto.BoardDto;
import carbon.dto.CommentDto;
import carbon.dto.PageDto;
import carbon.dto.Search;
import carbon.service.BoardService;
import carbon.service.CommentService;
import lombok.extern.slf4j.Slf4j;

@RequestMapping("/board")
@Slf4j
@Controller
public class BoardController {

	@Autowired
	BoardService boardservice;
	
	@Autowired
	CommentService commentservice;
	

	@RequestMapping("/board_list.do") // 게시판 리스트 및 검색
	public String board_list(Model model, @RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range,
			@RequestParam(required = false, defaultValue = "type") String type,
			@RequestParam(required = false) String keyword) throws Exception {

		Search search = new Search();
		search.setType(type);
		search.setKeyword(keyword);
		model.addAttribute("getPage", search.getPage()); // 현재 페이지번호
		model.addAttribute("getListSize", search.getListSize()); // 보여줄 게시글 수

		int listcnt = boardservice.board_listcnt(search); // 총 게시물 수
		model.addAttribute("total_cnt", listcnt);

		search.pageInfo(page, range, listcnt);// 페이징
		model.addAttribute("pagedto", search);
		List<BoardDto> list = boardservice.board_list(search);
		log.info("board_list ={}", list);
		System.out.println(list);
		model.addAttribute("board_list", list);

		return "board/board_list";
	}

	@GetMapping("/board_getlist.do") // 게시글 조회 및 조회수 증가
	public String board_getlist(Model model, @RequestParam("board_idx") Integer board_idx, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		/* 조회수 증가 로직 쿠키사용 */
		Cookie oldCookie = null;
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("postView")) {
					oldCookie = cookie;
				}
			}
		}

		if (oldCookie != null) {
			if (!oldCookie.getValue().contains("[" + board_idx.toString() + "]")) {
				System.out.println("조회수 증가");
				boardservice.board_hitsupd(board_idx);
				oldCookie.setValue(oldCookie.getValue() + "_[" + board_idx + "]");
				oldCookie.setPath("/");
				/* oldCookie.setMaxAge(60 * 60 * 24); */
				oldCookie.setMaxAge(60);
				response.addCookie(oldCookie);
			} else {
				System.out.println("조회수 증가안함");
			}
		} else {
			System.out.println("조회수 증가");
			boardservice.board_hitsupd(board_idx);
			Cookie newCookie = new Cookie("postView", "[" + board_idx + "]");
			newCookie.setPath("/");
			newCookie.setMaxAge(60);
			/* newCookie.setMaxAge(60 * 60 * 24); */
			response.addCookie(newCookie);
		}

		/* 게시글 조회 */
		BoardDto list = boardservice.board_getlist(board_idx);
		model.addAttribute("board_list", list);

		/* 댓글 조회 */

		return "board/board_getlist";
	}

	@GetMapping("/board_getlistAjax.do") // ajax 게시글 조회 페이지
	public String board_getlistAjax(Model model, @RequestParam("board_idx") Integer board_idx,
			HttpServletRequest request, HttpServletResponse response) {

		model.addAttribute("board_idx", board_idx);

		return "board/board_getlistAjax";

	}

	@RequestMapping("/board_getlistAjax_action.do") // ajax 게시글 정보 조회 
	@ResponseBody
	public Map<String, Object> board_getlistAjax_action(@RequestParam("board_idx") Integer board_idx,
			HttpServletRequest request, HttpServletResponse response) throws Exception { 

		/* 조회수 증가 로직 쿠키사용 */
		Cookie oldCookie = null;
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("postView")) {
					oldCookie = cookie;
				}
			}
		}

		if (oldCookie != null) {
			if (!oldCookie.getValue().contains("[" + board_idx.toString() + "]")) {
				System.out.println("조회수 증가");
				boardservice.board_hitsupd(board_idx);
				oldCookie.setValue(oldCookie.getValue() + "_[" + board_idx + "]");
				oldCookie.setPath("/");
				/* oldCookie.setMaxAge(60 * 60 * 24); */
				oldCookie.setMaxAge(60);
				response.addCookie(oldCookie);
			} else {
				System.out.println("조회수 증가안함");
			}
		} else {
			System.out.println("조회수 증가");
			boardservice.board_hitsupd(board_idx);
			Cookie newCookie = new Cookie("postView", "[" + board_idx + "]");
			newCookie.setPath("/");
			newCookie.setMaxAge(60);
			/* newCookie.setMaxAge(60 * 60 * 24); */
			response.addCookie(newCookie);
		}

		/* 게시글 조회 */
		BoardDto list = boardservice.board_getlist(board_idx);

		/* 댓글 조회 */
		List<CommentDto> c_list = commentservice.comment_list(board_idx);
		Integer c_count = commentservice.comment_count(board_idx);
		log.info("c_list ={}", c_list);
		Map<String, Object> output = new HashMap<>();
		output.put("list", list);
		output.put("c_list", c_list);
		output.put("c_count", c_count);

		return output;

	}

	@RequestMapping("/board_write.do") // 글쓰기 페이지
	public String board_write(HttpSession session) {

		/* String member_idx= (String) session.getAttribute("member_idx"); */

		return "board/board_write";
	}
	
	@RequestMapping("/write_action.do") // 글쓰기 액션 public String
	public String write_action(@ModelAttribute BoardDto boardDto) throws Exception { // 현재 날짜/시간
	  
		/*
		 * LocalDateTime datetime = LocalDateTime.now(); DateTimeFormatter formatter =
		 * DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"); String now =
		 * datetime.format(formatter);
		 */
	  
	  Timestamp datetime = Timestamp.valueOf(LocalDateTime.now());
	  
	  boardDto.setBoard_date(datetime); boardservice.board_insert(boardDto);
	  
	  log.info("board_list ={}",boardDto);
	  
	  return "redirect:/board/board_list.do";
	  
	  }
	 
}

