package carbon.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.io.FilenameUtils;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import carbon.dto.CategoryDto;
import carbon.dto.TestDto;
import carbon.mapper.UploadDataMapper;
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
		
		String extension = FilenameUtils.getExtension(file.getOriginalFilename()); // 
		System.out.println(extension);
		if (!extension.equals("xlsx") && !extension.equals("xls")) {
			throw new IOException("엑셀파일만 업로드 해주세요.");
		}

		Workbook workbook = null;

		if (extension.equals("xlsx")) {
			workbook = new XSSFWorkbook(file.getInputStream());
		} else if (extension.equals("xls")) {
			workbook = new HSSFWorkbook(file.getInputStream());
		}

		List<TestDto> dataList = new ArrayList<>();
		
		//시트 가져오기
		Sheet worksheet = workbook.getSheetAt(0);
		// 0번째줄 읽기
		Row row = worksheet.getRow(0);

		System.out.println(row);
		System.out.println(worksheet.getPhysicalNumberOfRows()); // 총 열 갯수
		
		TestDto testdto = new TestDto();
		/*
		 * testdto.setTest_content(row.getCell(0).getStringCellValue());
		 * testdto.setTest_date(row.getCell(1).getStringCellValue());
		 * testdto.setNum((int)row.getCell(2).getNumericCellValue());
		 */
		
		workbook.close();
		log.info("list={}", testdto);

		return "redirect:/upload.do";

	}
	
}
