package carbon.service;

import java.util.List;

import carbon.dto.CategoryDto;
import carbon.dto.CbntrdataDto;

public interface CarbondataService {

	List<CbntrdataDto> SelectDatayear();

	List<CategoryDto> categorynm();

	List<CbntrdataDto> SelectDataStack();

	List<CbntrdataDto> SelectLowData(Integer low_date);

	List<CategoryDto> SelectLowPrdtnm(String cata_name);

	List<CbntrdataDto> SelectData(Integer low_date);

	List<CbntrdataDto> Selectyear();

	List<CategoryDto> CategoryCount();

	List<CategoryDto> SelectviPrdtnm(String cata_name);

	List<CbntrdataDto> SelectLowDatayear();

	List<CategoryDto> categoryLownm();

	List<CategoryDto> CategoryLowCount();

}
