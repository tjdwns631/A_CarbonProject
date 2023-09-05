package carbon.service;

import java.util.List;

import carbon.dto.CategoryDto;
import carbon.dto.TestDto;

public interface UploadService  {

	List<CategoryDto> select_category(String inben, String exha, String bcate);

	List<TestDto> cate(String inben);


}
