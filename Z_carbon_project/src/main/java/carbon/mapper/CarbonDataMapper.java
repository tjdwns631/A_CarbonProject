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

	List<CbntrdataDto> SelectDatalow(Integer low_date);

	List<CategoryDto> SelectPrdtnm();

	List<CbntrdataDto> SelectData(Integer low_date);

	List<CbntrdataDto> Selectyear();


}
