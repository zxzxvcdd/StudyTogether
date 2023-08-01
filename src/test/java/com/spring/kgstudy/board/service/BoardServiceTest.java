package com.spring.kgstudy.board.service;

import javax.annotation.Resource;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.context.web.WebAppConfiguration;

import com.spring.kgstudy.board.vo.BoardVO;


@WebAppConfiguration
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/appServlet/*.xml","file:src/main/webapp/WEB-INF/spring/root-context.xml"})
class BoardServiceTest {


	
	@Test
	void test() {
		
		
		for(int i=1;i<=200; i++) {
			String sql ="		INSERT INTO Board"
					+ "		(board_id, user_id, title, content, writer, indate, count, boardGroup, boardSequence, boardLevel, boardAvailable)"
					+ "		values(board_seq.nextval, 'user" + i +"', '테스트 게시글 "+ i +"', '내용입니다 "+i+"','유저" +i+ "', sysdate, 0,"
					+ "		board_seq.currval, 0, 0, 1);";
			System.out.println(sql);
			
		}
		
		
	}

}
