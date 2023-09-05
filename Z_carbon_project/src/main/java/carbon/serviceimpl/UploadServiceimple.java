package carbon.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import carbon.dto.CategoryDto;
import carbon.dto.TestDto;
import carbon.mapper.UploadDataMapper;
import carbon.service.UploadService;

@Service
public class UploadServiceimple implements UploadService {

	@Autowired
	UploadDataMapper uploaddatamapper;

	@Override
	public List<CategoryDto> select_category(String inben, String exha, String bcate) {
		return uploaddatamapper.selectcate(inben, exha, bcate);
	}

	@Override
	public List<TestDto> cate(String inben) {
		// TODO Auto-generated method stub
		return uploaddatamapper.cate(inben);
	}


}
