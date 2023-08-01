package com.spring.kgstudy.member.service;

import java.net.URL;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import java.util.Random;
import java.util.Random;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.context.web.WebAppConfiguration;

import com.spring.kgstudy.member.vo.MemberVO;

@WebAppConfiguration
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/appServlet/*.xml","file:src/main/webapp/WEB-INF/spring/root-context.xml"})
class MemberServiceTest {

	@Autowired
	MemberService service;
	
	
	@Test
	void adminInsertTest() {

	
		MemberVO admin = new MemberVO("admin", "admin", "관리자", "admin@kgstudy.com","010-4545-4444","M",new Date(),"admin");
		

		service.insertUser(admin);
	
	}
	
	
	/*
	 * @Test void path() {
	 * 
	 * String rootPath = System.getProperty("user.dir").replace("\\", "/");
	 * 
	 * 
	 * System.out.println(rootPath); URL r = this.getClass().getResource("");
	 * 
	 * String path = r.getPath();
	 * 
	 * System.out.println(path);
	 * 
	 * 
	 * }
	 */
	

	
	
	
	@Test
	void InsertMemberTest() {
		
		LocalDate now = LocalDate.now();
		
		LocalDate start = now.minusYears(90);
		
		
		for(int i=1; i<=200; i++) {
			
			 Random random = new Random();
			 Long ranDay = (long) (random.nextInt((int) (now.toEpochDay() -start.toEpochDay()+1)) + start.toEpochDay());
				Date birthday = 	Date.from(LocalDate.ofEpochDay(ranDay).atStartOfDay(ZoneId.systemDefault()).toInstant());
				
			MemberVO member = new MemberVO("user"+i, "user"+i, "유저"+i, "user"+i+"@kgstudy.com","010-4545-4444","M",new Date(),"admin");
			
			String userName = "user"+i;
		
	

			String email = userName+"@kgstudy.com";
			String tel = "010-4545-4444";
			
			
			String gender="F";
			if(i%2==0) {
				gender="M";
			}
					
			
			member.setUser_name(userName);
			member.setUser_pw(userName);
			member.setUser_grant("user");
			member.setUser_gender(gender);
			member.setUser_tel(tel);
			member.setUser_email(email);
			member.setUser_birthday(birthday);
			

			service.insertUser(member);
			
		}

	
	
	
	}

}
