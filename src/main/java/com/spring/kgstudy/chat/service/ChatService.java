package com.spring.kgstudy.chat.service;

import java.io.File;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.spring.kgstudy.chat.dao.ChatDAO;
import com.spring.kgstudy.chat.dto.ChatInfoDTO;
import com.spring.kgstudy.chat.vo.ChatRoomVO;
import com.spring.kgstudy.chat.vo.ChatUserVO;
import com.spring.kgstudy.chat.vo.ChatVO;
import com.spring.kgstudy.common.paging.Page;
import com.spring.kgstudy.common.paging.PageMaker;
import com.spring.kgstudy.common.search.Search;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class ChatService {

	@Autowired
	private SimpMessagingTemplate template;
	
	private final ChatDAO chatDao;
	
	@Value("${file.path}")
	private String uploadPath;  
	
	public List<ChatUserVO> getAllMember(ChatUserVO chatUser){
		
		
		return chatDao.findAllUser(chatUser);
		
		
		
	}
	
	
	
	public Map<String, Object> getAllChatRoom(Search search) {
		
		Map<String,Object> resMap = new HashMap<String,Object>();
		List<ChatRoomVO> chatRoomList = chatDao.findAllRoom(search);
		
		
		int tc = chatDao.findAllRoomCnt(search);
		
		PageMaker pm = new PageMaker(
				new Page(search.getPageNum(), search.getAmount())
				, tc);
		
		
		
	
		
		
		resMap.put("chatRoomList", chatRoomList);
		resMap.put("paging", pm);
		resMap.put("search", search);
		
		
		return resMap;
		
		
		
		
	}
	
	
	
	public Map<String, Object> getChatRoomInfo(ChatUserVO user, Search search) {
		
		
		
		
		Map<String,Object> resMap = new HashMap<String,Object>();
		Calendar cal = Calendar.getInstance();
		
		Date now = new Date();
		
		

		String userId = user.getUserId();
		int roomId = user.getChatRoomId();
		
		
		
		if(isRoomFull(roomId)) {
			
			setMsg(resMap, "방이 꽉 찼습니다.", false);
			
			return resMap;
			
		}
		
		
		
		ChatVO chat = insertUser(user);
		user = findOneChatUser(user);
		
		if(chat!=null) {
			
			
			chat.setChatContent(userId+"님이 입장하였습니다.");
	
			
			insertChat(chat);
			
			//web socket 검색
			
		}
		
		
		Date lastStamp = user.getChatUserStamp();
		
		System.out.println(lastStamp);
		
		
		if(lastStamp!=null && lastStamp.getDate()<=now.getDate()) {
			
			
			
			cal.setTime(user.getChatUserStamp());
				
			cal.add(Calendar.DATE, -7);
				
			search.setStartDate(cal.getTime());
			
		}
		
		cal.setTime(now);
		cal.add(Calendar.DATE,999);
		user.setChatUserStamp(cal.getTime());
		chatDao.updateChatUser(user);
		
		List<ChatVO> chatList = updateChatCnt(roomId, search);
		
		ChatInfoDTO chatInfo = chatDao.findOneRoom(user.getChatRoomId());
		
		
		
		List<ChatUserVO> userList = chatDao.findAllChatUser(user);
		

		if(lastStamp!=null) {
			for(int i=0; i<chatList.size();i++) {
				
				ChatVO temp =chatList.get(i);
				
				
				if(temp.getChatDate().getTime()>lastStamp.getTime()) {
					
					
					System.out.println("insert alert");
					ChatVO alert = new ChatVO();
					
					alert.setChatId(-1);
					alert.setUserId("admin");
					alert.setChatState("alert");
					alert.setChatContent("여기까지 읽으셨습니다.");
					
					chatList.add(i-1,alert);
					
					break;
					
				}
				
				
			}
		}
		

		
		
		chatInfo.setChatList(chatList);
		chatInfo.setChatUserList(userList);
		
	
		
		

		resMap.put("chatInfo", chatInfo);
		setMsg(resMap, "방에 입장합니다..", true);
		
		
		
		return resMap;
		
	}
	
	
	public void setMsg(Map<String, Object> resMap, String str, boolean flag ) {
		
		resMap.put("flag", flag);
		resMap.put("msg", str);
	}
	
	
	public Map<String, Object> createChatRoom(ChatRoomVO chatRoom,String[] userList,MultipartFile file) {
	
		
		Map<String,Object> resMap = new HashMap<String,Object>();
	
		String newPath="\\studyBanner";
		String fullPath="/studyBanner/defaultImg.jpg";


		setMsg(resMap,"방 생성 실패",false);
		
		if(userList!=null){
			
			if(userList.length>chatRoom.getChatRoomMax()) {
				setMsg(resMap,"최대 인원수 초과",false);
				return resMap;
			}
		}
	
		
		String inviteList = "";
		List<String> inviteFail = new ArrayList<String>();
		resMap.put("inviteFail", inviteFail);

	
		if(file!=null) {
		
        String newFileName = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();

        
        File f = new File(uploadPath + newPath, newFileName);

        
        try {
			file.transferTo(f);
        } catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return resMap;
		}
        
        fullPath = newPath + "\\" + newFileName;

        fullPath = fullPath.replace("\\", "/");
   
        
		}
		chatRoom.setChatRoomImg(fullPath);
		
		
		if(chatDao.insertChatRoom(chatRoom)) {
			
			setMsg(resMap,"방 생성 완료",true);
			
			ChatVO chat = null;
			
			if(userList!=null&&userList.length>0) {
				
				ChatUserVO chatUser = new ChatUserVO();
				chatUser.setChatRoomId(chatRoom.getChatRoomId());
				


		        
				for(String user : userList) {
					
					
					chatUser.setUserId(user);
					chat = insertUser(chatUser);
					if(chat!=null) {
					
						inviteList+= user+"님, ";
						
					}else {
						
						inviteFail.add(user);
					}
					
				}
				
				inviteList +="이 초대되었습니다.";
				
				
				chat.setChatContent(inviteList);
				insertChat(chat);
				
				
				//websocket 검색
				
				setMsg(resMap,"방생성 및 회원 초대 완료",true);
				
			}
			
			
			
		}

		
		return resMap;
		

	}
	
	
	
	public ChatVO insertUser(ChatUserVO chatUser) {
		
		

		if(chatDao.findOneChatUser(chatUser)==null) {
		
			chatUser.setRoomAuth("user");
		
		
			if(!chatDao.insertChatUser(chatUser)) return null;
			
			ChatVO chat = new ChatVO();
			
			chat.setUserId("admin");
		
			chat.setChatRoomId(chatUser.getChatRoomId());
			chat.setChatState("alert");
			
			return chat;
			
		
		}
		
		return null;

		
	}

	
	public String inviteUser(ChatUserVO chatUser) {
		
		
		
		String result = "";
		
		if(isRoomFull(chatUser.getChatRoomId())) {
			
			result= "방이 꽉찼습니다.";
		}else {
		
		
			ChatVO chat =insertUser(chatUser);
			
			if(chat!=null) {
				
				chat.setChatContent(chatUser.getUserId()+"님이 초대되었습니다.");
				insertChat(chat);
				
				result="회원이 초대되었습니다.";
				
				
			}else {
				
				result="이미 참여한 회원입니다.";
			}
			
			
		}
		
		return result;
		
		
		
	}
	
	
	public boolean isRoomFull(int roomId) {
		
		
		boolean flag = false; 
		ChatRoomVO room = chatDao.findOneRoom(roomId);

		int maxCnt = room.getChatRoomMax();
		
		int roomCnt = room.getChatRoomCnt();
		
		if(roomCnt >=maxCnt) {
			flag= true;
		}

		return flag;
		
	}

	public boolean insertChat(ChatVO chat) {
		
		boolean flag = false;
		
		
		chat.setChatDate(new Date());
		
		flag= chatDao.insertChat(chat);
		
		System.out.println("insertChat : " + flag);
		if(flag) {
			sendChat(chat);
		}
		
		return flag;
		
		
		
	}
	
	public ChatUserVO findOneChatUser(ChatUserVO user) {
		
		
		return chatDao.findOneChatUser(user);
		
		
	}
	
	
	public boolean updateChatRoom(ChatRoomVO chatRoom){

		
		boolean flag= false;
		
		flag = chatDao.updateChatRoom(chatRoom);
		
		
		return flag;
		
		
		
	}
	
	public boolean updateChatUser(ChatUserVO chatUser){
		
		
		boolean flag= false;
		
		flag = chatDao.updateChatUser(chatUser);
		
		
		
		return flag;
		
		
		
	}
	
	
	public boolean updateChat(ChatVO chat, Search search){
		
		
		boolean flag= false;
		
		flag = chatDao.updateChat(chat);
		
		
		
		return flag;
		
		
		
	}
	
	
	
	
	
	public List<ChatVO> updateChatCnt(int chatRoomId, Search search) {
		
		
		
		
		chatDao.updateChatCnt(chatRoomId);
		

		List<ChatVO> chatList = chatDao.findAllChat(chatRoomId, search);
		
		
		String subUrl= "/topic/chat/update/"+chatRoomId;
		

		
		
		template.convertAndSend(subUrl,chatList);
		
		
		
		
		return chatList;
	}
	
	
	

	public boolean deleteChatRoom(ChatRoomVO chatRoom){

		
		boolean flag= false;
		
		flag = chatDao.deleteChatRoom(chatRoom);
		
		
		return flag;
		
		
		
	}
	
	public boolean deleteChatUser(ChatUserVO chatUser){
		
		
		boolean flag= false;
		
		flag = chatDao.deleteChatUser(chatUser);
		
		
		
		return flag;
		
		
		
	}
	
	
	public boolean deleteChat(ChatVO chat, Search search){
		
		
		boolean flag= false;
		
		flag = chatDao.deleteChat(chat);
		
		
		
		return flag;
		
		
		
	}



	public void sendChat(ChatVO chat) {
		
		
		String subUrl= "/topic/chat/room/"+chat.getChatRoomId();
		

		
		
		template.convertAndSend(subUrl, chat);
		

		
		
	}	
	
	

	
}
