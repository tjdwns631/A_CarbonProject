package carbon.controller;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;

import carbon.dto.CategoryDto;
import carbon.dto.TestDto;
import carbon.service.UploadService;

class JUnitTest {
	
	@Autowired
	UploadService uploadservice;
	
	@Test
	void test() {
		String inben = "배출인벤토리";String exha = "직접배출";String bcate = "에너지";	String unit = "에너지산업";Integer year = 2018;Integer exha_val = 220000;
		
		List<TestDto> test = uploadservice.cate(inben);

		//List<CategoryDto> categorydto = uploadservice.select_category(inben, exha, bcate);

		System.out.println("categorydto : " + test);
		//System.out.println("categorydto22222 : " + categorydto);
	}

}
