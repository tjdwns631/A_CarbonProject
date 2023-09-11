package carbon.service;

import java.util.List;

import carbon.dto.CategoryDto;
import carbon.dto.CbntrdataDto;

public interface CarbondataService {

	List<CbntrdataDto> SelectDatayear();

	List<CategoryDto> categorynm();

	List<CbntrdataDto> SelectDataStack();

	List<CbntrdataDto> SelectDatalow(Integer low_date);

	List<CategoryDto> SelectPrdtnm();

}