package carbon.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import carbon.dto.CategoryDto;
import carbon.dto.CbntrdataDto;
import carbon.mapper.CarbonDataMapper;
import carbon.service.CarbondataService;

@Service
public class CarbondataServiceimple implements CarbondataService{

	@Autowired
	CarbonDataMapper carbondatamapper;
	
	@Override
	public List<CbntrdataDto> SelectDatayear() {
		// TODO Auto-generated method stub
		return carbondatamapper.SelectDatayear();
	}

	@Override
	public List<CategoryDto> categorynm() {
		// TODO Auto-generated method stub
		return carbondatamapper.categorynm();
	}

	@Override
	public List<CbntrdataDto> SelectDataStack() {
		// TODO Auto-generated method stub
		return carbondatamapper.SelectDataStack();
	}

	@Override
	public List<CbntrdataDto> SelectLowData(Integer low_date) {
		// TODO Auto-generated method stub
		return carbondatamapper.SelectLowData(low_date);
	}

	@Override
	public List<CategoryDto> SelectLowPrdtnm(String cata_name) {
		// TODO Auto-generated method stub
		return carbondatamapper.SelectLowPrdtnm(cata_name);
	}

	@Override
	public List<CbntrdataDto> SelectData(Integer low_date) {
		// TODO Auto-generated method stub
		return carbondatamapper.SelectData(low_date);
	}

	@Override
	public List<CbntrdataDto> Selectyear() {
		// TODO Auto-generated method stub
		return carbondatamapper.Selectyear();
	}

	@Override
	public List<CategoryDto> CategoryCount() {
		// TODO Auto-generated method stub
		return carbondatamapper.CategoryCount();
	}

	@Override
	public List<CategoryDto> SelectviPrdtnm(String cate_nm) {
		// TODO Auto-generated method stub
		return carbondatamapper.SelectviPrdtnm(cate_nm);
	}

	@Override
	public List<CbntrdataDto> SelectLowDatayear() {
		// TODO Auto-generated method stub
		return carbondatamapper.SelectLowDatayear();
	}

	@Override
	public List<CategoryDto> categoryLownm() {
		// TODO Auto-generated method stub
		return carbondatamapper.categoryLownm();
	}

	@Override
	public List<CategoryDto> CategoryLowCount() {
		// TODO Auto-generated method stub
		return carbondatamapper.CategoryLowCount();
	}

}
