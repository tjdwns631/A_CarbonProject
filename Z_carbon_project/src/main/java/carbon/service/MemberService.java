package carbon.service;

import java.util.List;

import carbon.dto.MemberDto;

public interface MemberService {

	List<MemberDto> select_member();

	List<MemberDto> select_id(String member_id) throws Exception;

}
