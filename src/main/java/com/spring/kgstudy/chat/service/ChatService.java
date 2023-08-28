package com.spring.kgstudy.chat.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;

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


	private final ChatDAO chatDao;
	
	@Resource(name="uploadPath")
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
		
		ChatVO chat = insertUser(user);
		
		
		if(chat!=null) {
			
			
			chat.setChatContent(userId+"님이 입장하였습니다.");
	
			
			insertChat(chat);
			
			//web socket 검색
			
		}
		
		
		Date lastStamp = user.getChatUserStamp();
		
		if(lastStamp!=null && lastStamp.getDate()<=now.getDate()) {
			cal.setTime(user.getChatUserStamp());
				
			cal.add(Calendar.DATE, -7);
				
			search.setStartDate(cal.getTime());
			resMap.put("lastStamp", lastStamp);
			
		}
		
		cal.setTime(now);
		cal.add(Calendar.DATE,999);
		user.setChatUserStamp(cal.getTime());
		chatDao.updateChatUser(user);
		chatDao.updateChatCnt(user.getChatRoomId());
		
		ChatInfoDTO chatInfo = chatDao.findOneRoom(user.getChatRoomId());
		
		List<ChatVO> chatList = chatDao.findAllChat(roomId, search);
		
		List<ChatUserVO> userList = chatDao.findAllChatUser(user);
		
		
		
		chatInfo.setChatList(chatList);
		chatInfo.setChatUserList(userList);
		
	
		
		

		resMap.put("chatInfo", chatInfo);
		
		
		
		
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
			chat.setChatDate(new Date());
			chat.setChatRoomId(chatUser.getChatRoomId());
			chat.setChatState("alert");
			
			return chat;
			
		
		}
		
		return null;

		
	}

	
	public boolean inviteUser(ChatUserVO chatUser) {
		
		
		boolean flag= false;
		
		ChatVO chat =insertUser(chatUser);
		
		if(chat!=null) {
			
			chat.setChatContent(chatUser.getUserId()+"님이 초대되었습니다.");
			flag = insertChat(chat);
			
			
		}
		
		
		return flag;
		
		
		
	}
	

	public boolean insertChat(ChatVO chat) {
		
		boolean flag = false;
		
		
		flag= chatDao.insertChat(chat);
		
		
		//web socket 검색
		
		
		return flag;
		
		
		
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
	
	
	
	
	
	public boolean updateChatCnt(int chatRoomId) {
		boolean flag= false;
		
		flag = chatDao.updateChatCnt(chatRoomId);
		
		
		return flag;
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
	
	

	
}
