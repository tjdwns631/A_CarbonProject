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

}
