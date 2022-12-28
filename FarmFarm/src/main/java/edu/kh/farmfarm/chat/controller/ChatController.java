package edu.kh.farmfarm.chat.controller;

import java.io.IOException;
import java.net.http.HttpHeaders;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;

import edu.kh.farmfarm.chat.model.service.ChatService;
import edu.kh.farmfarm.chat.model.vo.Chat;
import edu.kh.farmfarm.chat.model.vo.ChatRoom;
import edu.kh.farmfarm.member.model.VO.Member;

@Controller
@SessionAttributes({"loginMember", "shortcutNo"})
public class ChatController {
	
	@Autowired
	private ChatService service;
	
	// 채팅 페이지로 이동
	@GetMapping("/chat")
	public String goChatPage() {
		return "chat/myChat";
	}
	
	// 내 채팅방 목록 가져오기
	@PostMapping("/chat/chatRoomList")
	@ResponseBody
	public String getChatRoomList(
			HttpSession session
//			@RequestParam(value = "memberNo", required = true) int memberNo
			){
		
		int myMemberNo = -1;
		String myMemberNickname = "";
		
		// 1. 세션에서 로그인 중인 회원의 정보가 담긴 객체를 가져옴
		if(session.getAttribute("loginMember") != null) {
			// 2. 회원 정보 객체에서 회원 번호를 꺼냄
			Member loginMember = (Member)session.getAttribute("loginMember");
			myMemberNo = loginMember.getMemberNo();
			myMemberNickname = loginMember.getMemberNickname();

			// 3. 회원 번호를 보내, 회원이 참가중인 모든 채팅방을 가져옴
			List<ChatRoom> chatRoomList = service.getChatRoomList(myMemberNo);
		
			
			// 4. 회원 정보를 재배치 : 내 이름, 내 정보는 MEMBER_NO, MEMBER_NICKNAME으로,
			//                    상대 이름, 상대 정보는 MEMBER_NO2, MEMBER_NICKNAME2로 세팅
			for(ChatRoom chatRoom : chatRoomList) {
				if(chatRoom.getMemberNo2() == myMemberNo ) {
					int tempNo = chatRoom.getMemberNo();
					chatRoom.setMemberNo(myMemberNo);
					chatRoom.setMemberNo2(tempNo);
				}
				if(chatRoom.getMemberNickname2().equals(myMemberNickname)) {
					String tempNickname = chatRoom.getMemberNickname();
					chatRoom.setMemberNickname(myMemberNickname);
					chatRoom.setMemberNickname2(tempNickname);
				}
			}
			
			// 5. map에 ChatRoom의 정보를 담음
			Map<String, Object> chatRoomMap = new HashMap<String, Object>();
			
			chatRoomMap.put("chatRoomList", chatRoomList);
			
			// 6. Gson을 이용해 반환
			return new Gson().toJson(chatRoomMap);
			
		} else {
			return new Gson().toJson("empty");
		}
		
	}
	
	// 해당 채팅방의 채팅내역 가져오기
	@PostMapping("/chat/{roomNo}")
	@ResponseBody
	public String getChatHistory(
			HttpSession session,
			@PathVariable(value = "roomNo") int roomNo
			){
		// 1. 세션에서 로그인 중인 회원의 정보가 담긴 객체를 가져옴
		Member loginMember = (Member)session.getAttribute("loginMember");
		
		// 2. 회원 정보 객체에서 회원 번호를 꺼냄
		int myMemberNo = loginMember.getMemberNo();
		
		// 3. roomNo와 loginMemberNo를 보내 채팅 읽음 여부를 업데이트 함
		Map<String, Object> updateInfo = new HashMap<String, Object>();
		updateInfo.put("roomNo", roomNo);
		updateInfo.put("myMemberNo", myMemberNo);
		
		int result = service.updateChatReadFl(updateInfo);
		
		System.out.println(result);
		
		// 4. 다시 roomNo를 보내서 채팅 목록을 가져옴
		List<Chat> chatHistory = service.getChatHistory(roomNo);
		
		
		// 5. 내 회원 번호, 채팅 목록을 Map에 담음
		Map<String, Object> chatHistoryMap = new HashMap<String, Object>();
		
		chatHistoryMap.put("myMemberNo", myMemberNo);
		chatHistoryMap.put("chatHistory", chatHistory);
		
		// 6. 반환
		return new Gson().toJson(chatHistoryMap);
	}
	
	// 해당 채팅방의 채팅내역 가져오기
	@PostMapping("/chat/{roomNo}/shortcut")
	@ResponseBody
	public String getChatHistoryAndPartnerInfo(
			HttpSession session,
			@PathVariable(value = "roomNo") int roomNo
			){
		// 1. 세션에서 로그인 중인 회원의 정보가 담긴 객체를 가져옴
		Member loginMember = (Member)session.getAttribute("loginMember");
		
		// 2. 회원 정보 객체에서 회원 번호를 꺼냄
		int myMemberNo = loginMember.getMemberNo();
		
		// 3. roomNo와 loginMemberNo를 보내 채팅을 읽음처리함
		Map<String, Object> updateInfo = new HashMap<String, Object>();
		updateInfo.put("roomNo", roomNo);
		updateInfo.put("myMemberNo", myMemberNo);
		
		int result = service.updateChatReadFl(updateInfo);
		
		System.out.println(result);
		
		// 4. 다시 roomNo를 보내서 채팅 목록을 가져옴
		List<Chat> chatHistory = service.getChatHistory(roomNo);
		
		// 5. 한번 더 roomNo를 보내서 채팅방의 정보를 가져옴
		service.selectRoomInfo();

		// 6. 내 회원 번호, 채팅방 정보, 채팅 목록을 Map에 담음
		Map<String, Object> chatHistoryMap = new HashMap<String, Object>();
		
		chatHistoryMap.put("myMemberNo", myMemberNo);
		chatHistoryMap.put("chatHistory", chatHistory);
		
		// 7. 상대방의 이미지와 이름을 가져옴
		
		Member partner = service.findPartnerInfo(roomNo, myMemberNo);
		
		Map<String, Object> partnerInfo = new HashMap<String, Object>();
		partnerInfo.put("profileImg", partner.getProfileImg());
		partnerInfo.put("memberNickname", partner.getMemberNickname());
		
		chatHistoryMap.put("partnerInfo", partnerInfo);
		
		// 6. 반환
		return new Gson().toJson(chatHistoryMap);
	}

	
	// 서버에 사진 저장하기
	@PostMapping("/chat/insert/img")
	@ResponseBody
	public String insertChatImg(
			int roomNo,
			int sendMemberNo,
			MultipartFile chatImg,
			HttpSession session) throws IllegalStateException, IOException {
		
		System.out.println("insertChatImg");
		
		// webPath
		String webPath = "/resources/images/chat/storage";
		
		// 저장소 번호
		int storageNo = (int)(Math.random() * 5) + 1;
		
		// 저장소 번호 붙이기
		webPath += storageNo + "/";
		
		// 폴더 경로
		String folderPath = session.getServletContext().getRealPath(webPath);
		
		// 삽입
		String chatContent = service.insertChatImg(roomNo, sendMemberNo, chatImg, webPath, folderPath);
		
		
		return new Gson().toJson(chatContent);
		
	}
	
	// 채팅방 개설
	@PostMapping("/chat/insert/room")
	public String insertNewRoom(int postNo, 
			HttpSession session,
			RedirectAttributes ra,
			@RequestHeader(value = "referer") String referer) {
		
		String path = referer;
				
		if(session.getAttribute("loginMember") != null) {
			// 세션에 로그인 회원 정보가 있을 때만 방 생성을 시작함
			Member loginMember = (Member)session.getAttribute("loginMember");
			int memberNo = loginMember.getMemberNo();

			// 1. 내 권한을 확인해서, 구매자일때만 실행
			if(loginMember.getAuthority() == 0) {
				
					// 2. 판매자 번호를 가져옴
					int memberNo2 = service.selectSellerNo(postNo);
					
					// 3. 내 번호(memberNo), 판매자 번호(memberNo2), 상품 정보를 가지고 가서 채팅방을 만듦
					
					
					ChatRoom chatRoom = new ChatRoom();
					chatRoom.setMemberNo(memberNo);
					chatRoom.setMemberNo2(memberNo2);
					chatRoom.setPostNo(postNo);
					
					int result = service.insertNewRoom(chatRoom); // 번호가 안가져와짐..
					
					ra.addFlashAttribute("shortcutNo", result);
					
					path = "/chat";
					
	//			if(result > 0) { // 채팅방이 개설되면 ~
	//				// 채팅방으로 고고
	//			} else { // 채팅방이 새로 개설되지 않았다 == 기존 채팅방이 있다 == 해당 채팅방으로 던짐
	//				ra.addFlashAttribute("shortcutNo", result);
	//				return "redirect:/chat";
	//			}
					
				} else {
					// 만약 로그인이 안되어있으면...돌려보냄!
					ra.addFlashAttribute("message", "일반 회원만 이용가능합니다.");
				}
			
			} else {
				ra.addFlashAttribute("message", "로그인 후 이용가능합니다.");
			}
		
		
		return "redirect:" + path;
	}
}
