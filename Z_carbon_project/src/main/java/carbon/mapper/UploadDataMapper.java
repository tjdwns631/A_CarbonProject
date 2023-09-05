package carbon.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import carbon.dto.CategoryDto;
import carbon.dto.TestDto;

@Mapper("uploaddatamapper")
public interface UploadDataMapper {

	List<CategoryDto> selectcate(String inben, String exha, String bcate);

	List<TestDto> cate(String inben);

}
