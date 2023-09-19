package carbon.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import carbon.dto.CategoryDto;
import carbon.dto.CbntrdataDto;

@Mapper("carbondatamapper")
public interface CarbonDataMapper {

	List<CbntrdataDto> SelectDatayear();

	List<CategoryDto> categorynm();

	List<CbntrdataDto> SelectDataStack();

	List<CbntrdataDto> SelectLowData(Integer low_date);

	List<CategoryDto> SelectLowPrdtnm(String cata_name);

	List<CbntrdataDto> SelectData(Integer low_date);

	List<CbntrdataDto> Selectyear();

	List<CategoryDto> CategoryCount();

	List<CategoryDto> SelectviPrdtnm(String cate_nm);

	List<CbntrdataDto> SelectLowDatayear();

	List<CategoryDto> categoryLownm();

	List<CategoryDto> CategoryLowCount();


}
