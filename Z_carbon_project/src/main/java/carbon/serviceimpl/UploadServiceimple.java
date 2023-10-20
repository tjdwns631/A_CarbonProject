package carbon.serviceimpl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.apache.commons.io.FilenameUtils;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import carbon.controller.UploadController;
import carbon.dto.CategoryDto;
import carbon.dto.CbntrdataDto;
import carbon.dto.ProductDto;
import carbon.dto.TestDto;
import carbon.mapper.UploadDataMapper;
import carbon.service.UploadService;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class UploadServiceimple implements UploadService {

	@Autowired
	UploadDataMapper uploaddatamapper;

	@Override
	public int upload_excel_data(MultipartFile file) throws IOException {
		
		String extension = FilenameUtils.getExtension(file.getOriginalFilename()); // 
		if (!extension.equals("xlsx") && !extension.equals("xls")) {
			throw new IOException("엑셀파일만 업로드 해주세요.");
		}

		Workbook workbook = null;

		if (extension.equals("xlsx")) {
			workbook = new XSSFWorkbook(file.getInputStream());
		} else if (extension.equals("xls")) {
			workbook = new HSSFWorkbook(file.getInputStream());
		}

		//시트 가져오기
		Sheet worksheet = workbook.getSheetAt(0);
		// 0번째줄 읽기
		Row row = worksheet.getRow(0);

		System.out.println(row);
		System.out.println(worksheet.getPhysicalNumberOfRows()); // 총 열 갯수
		System.out.println(worksheet.getRow(1).getCell(0).getStringCellValue()); //인벤토리
		System.out.println(worksheet.getRow(1).getCell(1).getStringCellValue()); //배출법
		System.out.println(worksheet.getRow(1).getCell(2).getStringCellValue()); //대분류
		System.out.println(worksheet.getRow(1).getCell(3).getStringCellValue()); //활동자료
		System.out.println((int)worksheet.getRow(1).getCell(4).getNumericCellValue()); //연도
		System.out.println((int)worksheet.getRow(1).getCell(5).getNumericCellValue()); //배출량
		System.out.println(worksheet.getPhysicalNumberOfRows()); // 총 열 갯수
		String cate_1 = worksheet.getRow(1).getCell(0).getStringCellValue(); //인벤토리
		String cate_2 = worksheet.getRow(1).getCell(1).getStringCellValue(); //배출법
		String cate_3 = worksheet.getRow(1).getCell(2).getStringCellValue(); //대분류
		String prdtnm = worksheet.getRow(1).getCell(3).getStringCellValue(); //활동자료
		Integer year = (int) worksheet.getRow(1).getCell(4).getNumericCellValue(); //연도
		Integer exha = (int) worksheet.getRow(1).getCell(5).getNumericCellValue(); //배출량
		
		String prdt_note = cate_1.substring(0,2)+">"+cate_2.substring(0,2)+">"+cate_3+">"+prdtnm; // note 입력값
		System.out.println("cate_1"+cate_1);
		System.out.println("cate_2"+cate_2);
		System.out.println("cate_3"+cate_3);
		System.out.println("prdt_note"+prdt_note);
		// 카테고리 sn 가져옴
		CategoryDto cate_data = uploaddatamapper.categorysn(cate_1, cate_2, cate_3); 
		log.info("cate_sn= {}", cate_data);
		// 카테고리 유뮤 체크
		if(cate_data == null) {
			int result = 1;
			return result;
		}else {
			
			// 카레고리 값 있을시
			System.out.println("널 아니래!~!~");
			System.out.println(cate_data.getCate_sn()); 
			Integer cate_sn = cate_data.getCate_sn();
			// 활동자료 sn 조회
			ProductDto product_data = uploaddatamapper.product_select(cate_sn,prdtnm);
			log.info("product_data= {}", product_data);
			
			//활동자료 유뮤 체크
			if(product_data == null) {
				System.out.println("product_data nullllllllll");
//				//활동자료가 업을때  카테고리sn, 활동자료 명, 활동자료 내용 값 insert 처리 후 prdt_sn 값 반환 받기  
//				int result = uploaddatamapper.product_insert(cate_sn,prdtnm,prdt_note);
//				
//				//배출량 insert 처리 
//				CbntrdataDto data_data = uploaddatamapper.data_select(year,result);
//				if(data_data == null) {
//					
//					//insert 처리 year, result, exha, prdt_note 값 입력
//					
//				}else {
//					//값이 있으면 false 처리 
//					int result1 = 1;
//					return result1;
//				}
				
				
			}else {
				//활동자료 sn가지고 와서 배출량 insert 처리
				Integer prdt_sn = product_data.getPrdt_sn();
				CbntrdataDto result_data = uploaddatamapper.data_select(year,prdt_sn);
				System.out.println("result_data : " + result_data);
//				if(result_data == 0) {
//					
//				}
			}
			
			return exha;
		}
		//System.out.println(cate_sn.getCate_sn());
		 
		//workbook.close();
		

		
	}
	
	@Override
	public List<CategoryDto> select_category(String inben, String exha, String bcate) {
		return uploaddatamapper.selectcate(inben, exha, bcate);
	}

	@Override
	public List<TestDto> cate(String inben) {
		// TODO Auto-generated method stub
		return uploaddatamapper.cate(inben);
	}


}
