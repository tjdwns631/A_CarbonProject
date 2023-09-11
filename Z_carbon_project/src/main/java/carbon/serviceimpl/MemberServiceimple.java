package carbon.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import carbon.dto.MemberDto;
import carbon.mapper.MemberMapper;
import carbon.service.MemberService;

@Service
public class MemberServiceimple implements MemberService {

	@Override
	public List<MemberDto> select_member() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MemberDto> select_id(String member_id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
