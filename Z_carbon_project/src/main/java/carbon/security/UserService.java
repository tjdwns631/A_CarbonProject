package carbon.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import carbon.dto.MemberDto;
import carbon.mapper.MemberMapper;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UserService implements UserDetailsService{
	
	@Autowired
	private final MemberMapper membermapper;
	
	@Override
	public UserDetails loadUserByUsername(String user_id) throws UsernameNotFoundException {
		
		MemberDto memberdto = membermapper.findByUserId(user_id);
		
		if(memberdto == null) {
			throw new UsernameNotFoundException("error");
			
		}else {
			
			User user = new User(memberdto);
			return user;
		}
		
	}

}
