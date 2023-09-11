package carbon.cmmn;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;


import carbon.security.CustomAuthFailureHandler;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class SecurityConfig {
	
	private final CustomAuthFailureHandler customAuthFailureHandler;
	
	@Bean
    public BCryptPasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
    }
	
	@Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
		
        http
        .csrf().disable()
        .authorizeHttpRequests((requests) -> requests
        		.requestMatchers(new AntPathRequestMatcher("/css/**"),new AntPathRequestMatcher("/images/**"),new AntPathRequestMatcher("/js/**"),
        						new AntPathRequestMatcher("/vendors/**"),new AntPathRequestMatcher("/common/**"),
        						new AntPathRequestMatcher("/login.do*")
        						/*new AntPathRequestMatcher("/dashboard.do"),new AntPathRequestMatcher("/dashboardSelectList.do"),new AntPathRequestMatcher("/dashboarddatalist.do")*/
        						).permitAll()
                //.requestMatchers("/css/**", "/img/**", "/js/**","/vendors/**" ,"/login","/error").permitAll()
                //.requestMatchers("/dashboard/dashboard_sis").hasRole("ADMIN")
                //.requestMatchers("/dashboard", "/main").hasAnyRole("ADMIN", "USER")
                .anyRequest().authenticated() //그외 모든 접근권한 인증
        )
        .formLogin((form) -> form
                .loginPage("/login.do") // 로그인 페이지
                .loginProcessingUrl("/login_action.do") //로그인 액션
                .usernameParameter("user_id")            // 아이디 파라미터명 설정
                .passwordParameter("user_pwd")            // 패스워드 파라미터명 설정
                .defaultSuccessUrl("/dashboard.do") // 성공후 페이지
                .failureHandler(customAuthFailureHandler)
                .permitAll()
        )
        .logout()
        .logoutUrl("/logout.do")
        .logoutSuccessUrl("/")
        .deleteCookies("JSESSIONID")
        .and();

        return http.build();

    }

	
}
