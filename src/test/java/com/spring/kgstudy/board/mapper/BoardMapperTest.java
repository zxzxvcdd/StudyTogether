package com.spring.kgstudy.board.mapper;

import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.context.web.WebAppConfiguration;

@WebAppConfiguration
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/appServlet/*.xml","file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class BoardMapperTest {
	
	@Autowired
	BoardMapper boardMapper;
	
//	@Test
//	public void testGetList() {
//		List<BoardVO> list = boardMapper.getList(null);
//		for(BoardVO vo : list){
//			System.out.println(vo);
//		}
//	}
	

}
