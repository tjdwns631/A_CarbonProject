package carbon.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import carbon.dto.CategoryDto;
import carbon.dto.CbntrdataDto;
import carbon.dto.ProductDto;
import carbon.dto.TestDto;

@Mapper("uploaddatamapper")
public interface UploadDataMapper {

	List<CategoryDto> selectcate(String inben, String exha, String bcate);

	List<TestDto> cate(String inben);

	CategoryDto categorysn(String cate_1, String cate_2, String cate_3);

	ProductDto product_select(Integer cate_sn, String prdtnm);

	int product_insert(Integer cate_sn, String prdtnm, String prdt_note);

	CbntrdataDto data_select(Integer year, Integer prdt_sn);

}
