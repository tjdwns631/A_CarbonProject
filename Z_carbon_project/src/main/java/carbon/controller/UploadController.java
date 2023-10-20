package carbon.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import carbon.dto.CategoryDto;
import carbon.dto.TestDto;
import carbon.service.UploadService;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class UploadController {
	
	@Autowired
	UploadService uploadservice;
	
	@RequestMapping("/upload.do") // 액셀 업로드 페이지 
	public String upload() throws Exception {

		return "upload";

	}
	
	@RequestMapping("/inser_test.do")
	@ResponseBody
	public String insert_test(){
		System.out.println("insert_test.do");
		String inben = "배출인벤토리";String exha = "직접배출";String bcate = "에너지";	String unit = "에너지산업";Integer year = 2018;Integer exha_val = 220000;
		
		
		List<TestDto> test =  uploadservice.cate(inben);
		
		List<CategoryDto> categorydto = uploadservice.select_category(inben,exha,bcate);
		
		System.out.println("categorydto : "+test);
		System.out.println("categorydto22222 : "+categorydto);
		
		return "";
		
	}

	@RequestMapping("/upload_action.do") // 추후 엑셀 업로드 기능 구현
	public String upload_action(@RequestParam(value = "file", required = false) MultipartFile file) throws IOException {
		
		//product 테이블 insert -> cbnrt 테이블 insert -> insert 한 idx 값 각 각 반환 후 -> data 테이블 insert
		
		uploadservice.upload_excel_data(file);
		
		return "redirect:/upload.do";

	}
	
}
