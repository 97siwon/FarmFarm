package edu.kh.farmfarm.chat2.model.service;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import edu.kh.farmfarm.chat2.model.vo.Chat2;
import edu.kh.farmfarm.chat2.model.vo.Chat2Enter;
import edu.kh.farmfarm.chat2.model.vo.Chat2Room;

public interface Chat2Service {

	/** 내 채팅방 목록 조회
	 * @param memberNo
	 * @return List<Chat2Room>
	 */
	List<Chat2Room> selectChatRoomList(int memberNo);

	/** 선택한 채팅방의 채팅 목록 조회
	 * @param roomNo
	 * @return List<Chat2>
	 */
	List<Chat2> selectChatList(int roomNo);

	/** 새로운 채팅방 개설하기
	 * @param memberNo
	 * @return roomNo(empty, then -1)
	 */
	int insertNewChat2Room(int memberNo, Chat2Room chatRoom);
	
	/** 채팅방 참가자 목록 조회
	 * @param roomNo
	 * @return
	 */
	public List<Integer> selectEnterMemberList(int roomNo);
	
	/** 채팅 전송
	 * @param chat
	 * @return
	 */
	public int insertNewChat(Chat2 chat);
	
	/** 사진형식 채팅 전송
	 * @param roomNo
	 * @param memberNo
	 * @param chatImg
	 * @param webPath
	 * @param folderPath
	 * @return
	 */
	String insertNewChatImg(int roomNo, int memberNo, MultipartFile chatImg, String webPath, String folderPath) throws IllegalStateException, IOException;

	/** 채팅방 정보 수정
	 * @param roomNo
	 * @param roomName
	 * @return
	 */
	int updateChat2Room(int roomNo, String roomName);

	/** 채팅방 입장
	 * @param roomNo
	 * @param memberNo
	 * @return
	 */
	int insertChat2Enter(int roomNo, int memberNo);

	/** 채팅방 탈퇴
	 * @param roomNo
	 * @param memberNo
	 * @return
	 */
	int updateChat2Enter(int roomNo, int memberNo);



}
