package com.example.demo.config;

import com.example.demo.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)  //  启用方法级别的权限认证
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    private UsersService usersService;
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                // 不保护的页面
                .authorizeRequests().antMatchers("/", "/index").permitAll()     // 首页
                .antMatchers("/css/**", "/img/**", "/plugins/**").permitAll()   // 静态资源
                .antMatchers("/swagger-ui.html").permitAll()                    // 接口文档
                // 其余页面需验证
                .anyRequest().authenticated()
                // 登录
                .and().formLogin().loginPage("/load").loginProcessingUrl("/login").defaultSuccessUrl("/index").failureUrl("/load").permitAll()
                // 注销
                .and().logout().logoutUrl("/logout").logoutSuccessUrl("/load").permitAll()
                // 关闭csrf保护
                .and().csrf().disable();
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(usersService).passwordEncoder(passwordEncoder());
    }

    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
}