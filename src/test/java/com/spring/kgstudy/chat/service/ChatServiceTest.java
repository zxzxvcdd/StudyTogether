package com.spring.kgstudy.chat.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.context.web.WebAppConfiguration;

import com.spring.kgstudy.chat.vo.ChatRoomVO;
import com.spring.kgstudy.chat.vo.ChatUserVO;
import com.spring.kgstudy.common.search.Search;


@WebAppConfiguration
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/appServlet/*.xml","file:src/main/webapp/WEB-INF/spring/root-context.xml"})
class ChatServiceTest {

	
	@Autowired
	ChatService service;
	
	
	@Test
	void insertChatRoomListTest() {
	
		
		for(int j=1;j<=100;j++ ) {
			ChatRoomVO chatRoom= new ChatRoomVO();
			
			chatRoom.setChatRoomTitle("스터디 투게더"+j);
			chatRoom.setChatRoomMax(j+10);
			chatRoom.setChatRoomCategory(0);
			chatRoom.setChatRoomDate(new Date());
			chatRoom.setChatRoomComment("함께 공부해요"+j);
			chatRoom.setChatRoomGoal("시험합격"+j);
			chatRoom.setChatRoomImg(j+".jpg");
			chatRoom.setChatRoomState("public");
			chatRoom.setExitOpt(0);
			chatRoom.setExitCk("Y");
			chatRoom.setUserId("admin");
			List<String> users = new ArrayList<String>();
			
			for(int i=1; i<=10; i++) {
			
				int k = j*10 +i;
				
				users.add("user"+k);
				
				
				
			}
			
	
			
			String[] userList = users.toArray(new String[users.size()]);
			
			
			Map<String,Object> resMap = service.createChatRoom(chatRoom, userList,null);
			
			
			System.out.println(resMap);
		
		}
		
	}
	
	@Test
	void getChatRoomInfoTest() {
		
	
		Search search = new Search();
		
		ChatUserVO user = new ChatUserVO();
		
		
		
		user.setChatRoomId(2);
		
		user.setUserId("user11");
		
		
		
	
		
		Map<String,Object> resMap = service.getChatRoomInfo(user, search);
		
		System.out.println(resMap);
		
		
		
	}

}
