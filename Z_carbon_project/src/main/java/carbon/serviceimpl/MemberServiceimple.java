package carbon.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import carbon.dto.MemberDto;
import carbon.mapper.MemberMapper;
import carbon.service.MemberService;

@Service
public class MemberServiceimple implements MemberService {

	@Autowired
	private MemberMapper membermapper;
	
	@Override
	public List<MemberDto> select_member() {
		System.out.println("imple");
		return membermapper.select_member();
	}

	@Override
	public List<MemberDto> select_id(String member_id) throws Exception{
		return membermapper.check_id(member_id);
	}

}
