package carbon.security;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import carbon.dto.MemberDto;

public class User implements UserDetails {
	
	MemberDto memberdto;
	
	public User(MemberDto memberdto) {
		this.memberdto = memberdto;
	}
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		// TODO Auto-generated method stub
		Collection<GrantedAuthority> collect = new ArrayList<>();
		collect.add(()->{return memberdto.getRole();});
		return collect;
	}

	@Override
	public String getPassword() {
		// TODO Auto-generated method stub
		return this.memberdto.getUser_pwd();
	}

	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return this.memberdto.getUser_nm();
	}

	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return true;
	}

}
