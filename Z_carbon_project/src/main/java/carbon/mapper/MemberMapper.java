package carbon.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import carbon.dto.MemberDto;

@Mapper("memberMapper")
public interface MemberMapper {

	List<MemberDto> select_member();

	List<MemberDto> check_id(String member_id);
	
}
