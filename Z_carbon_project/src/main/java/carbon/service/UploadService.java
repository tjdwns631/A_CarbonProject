package carbon.service;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import carbon.dto.CategoryDto;
import carbon.dto.TestDto;

public interface UploadService  {

	List<CategoryDto> select_category(String inben, String exha, String bcate);

	List<TestDto> cate(String inben);

	int upload_excel_data(MultipartFile file) throws IOException;


}
