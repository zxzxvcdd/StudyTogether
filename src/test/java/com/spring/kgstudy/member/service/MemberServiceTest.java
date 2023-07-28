package com.spring.kgstudy.member.service;

import java.util.Date;

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

}
